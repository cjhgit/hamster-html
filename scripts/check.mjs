import { chromium } from '@playwright/test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
const cachedChrome=path.join(os.homedir(),'Library/Caches/ms-playwright/chromium-1217/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing');
const executablePath=process.env.CHROME_PATH || (fs.existsSync(cachedChrome)?cachedChrome:undefined);
const browser=await chromium.launch({executablePath,headless:true});
const page=await browser.newPage({viewport:{width:742,height:550},deviceScaleFactor:1});
const errors=[];
page.on('pageerror',e=>errors.push(e.stack));
await page.addInitScript(()=>{
  let seed=11042;
  Math.random=()=>{seed=(seed*1664525+1013904223)>>>0;return seed/4294967296;};
});
await page.goto('http://127.0.0.1:5173');
await page.waitForTimeout(300);
console.log('Page errors:',errors);
await page.screenshot({path:'/private/tmp/hamster-canvas.png'});
if(errors.length) { await browser.close(); process.exit(1); }
await page.evaluate(()=>{hamsterApp.paused=true;});
try {
  // Actual pointer events exercise coordinate scaling, capture and release.
  await page.mouse.move(500,200);
  await page.mouse.down();
  assert.equal(await page.evaluate(()=>hamsterApp.root.freshFood.length),1);
  await page.mouse.move(540,150);
  await page.evaluate(()=>hamsterApp.step(1));
  assert.equal(await page.evaluate(()=>hamsterApp.root.food.drag),true);
  await page.mouse.up();
  assert.equal(await page.evaluate(()=>hamsterApp.root.food.drag),false);
  await page.evaluate(()=>hamsterApp.step(100));
  assert.equal(await page.evaluate(()=>hamsterApp.root.food.pos.y),206);
  console.log('PASS: pointer feeding, dragging, release, gravity and floor bounce');
  const report=await page.evaluate(()=>{
    const {root,step}=hamsterApp;
    const h=root.ham;
    const seen=new Set();
    function run(n) {
      for(let i=0;i<n;i++) {
        step();
        for(const key of ['isOnWheel','eating','drinking','cleaning','sleeping','isTired']) if(h[key]) seen.add(key);
        if(!Number.isFinite(h._x)||!Number.isFinite(h._y)) throw new Error('Invalid hamster position at '+h.frameNum);
      }
    }
    // Place food precisely at the original mouth pickup threshold.
    h.isOnWheel=false; h.getOnWheel=false; h.cleaning=false; h.drinking=false;
    const f=root.food;
    f.drag=true; root._xmouse=h.mouthPt.x; root._ymouse=h.mouthPt.y;
    run(1);
    run(180);
    f.drag=false;
    // Exercise original wheel click handler, with no food spawned at the hub.
    const count=root.freshFood.length;
    root._xmouse=167; root._ymouse=105; root.onMouseDown();
    const hubDoesNotFeed=root.freshFood.length===count;
    root.mouseActive=false;
    run(1500);
    // Thirst uses the same original decision path as natural depletion.
    h.isOnWheel=false; h.cleaning=false; h.eating=false; h.drinking=false; h.waterLevel=0;
    run(1800);
    // A long unattended run covers timers, autonomous wheel/rest and grooming.
    run(12000);
    // Fast-forward the idle sleep timer through the original sleep transition.
    h.isOnWheel=false; h.cleaning=false; h.eating=false; h.drinking=false;
    h.waterLevel=10; h.goingTo=0; h.dest=undefined; h.runAt=1e9; h.gotoRandomAt=1e9;
    h.goToSleep(); run(600);
    const didSleep=seen.has('sleeping');
    root._xmouse=140; root._ymouse=100; root.onMouseMove(); run(1);
    return {seen:[...seen],hubDoesNotFeed,didSleep,wokeUp:!h.sleeping,foodPool:root.freshFood.length+root.eatenFood.length,frames:h.frameNum};
  });
  console.log(report);
  assert.equal(report.hubDoesNotFeed,true);
  assert.equal(report.foodPool,10);
  for(const state of ['isOnWheel','eating','drinking','cleaning','sleeping','isTired']) assert.ok(report.seen.includes(state),`Missing state: ${state}`);
  assert.equal(report.wokeUp,true);
  assert.deepEqual(errors,[]);
  // The scale transform must also work at narrow mobile sizes.
  await page.setViewportSize({width:375,height:600});
  await page.mouse.click(250,300);
  await page.evaluate(()=>{hamsterApp.step(30);hamsterApp.render();});
  assert.equal(await page.evaluate(()=>document.documentElement.scrollWidth),375);
  console.log('PASS: all original behavior states, 9 minutes of simulation, food recycling and mobile sizing');
} finally { await browser.close(); }
