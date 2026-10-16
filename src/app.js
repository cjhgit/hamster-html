(() => {
  const canvas = document.getElementById('hamster');
  const ctx = canvas.getContext('2d');
  const globals = new Set(['Math','Object','Array','parseInt','undefined','System','WaterBottle','Hamster','Food','TextFormat','com','identity']);
  const root = new Proxy(new MovieClip(), {
    has: (_,key) => typeof key === 'string' && !globals.has(key),
    get: (target,key,receiver) => Reflect.get(target,key,receiver)
  });
  // Original FlashVars remain usable, including all thirteen color settings.
  for(const [key,value] of new URLSearchParams(location.search)) {
    if(/^up_\w+Color$/.test(key) && /^[\da-f]{6}$/i.test(value)) root[key]=value;
  }
  initializeTimeline.call(root,root);
  // The screenshot's widget occupies x=31..685, y=24..516. Its Flash stage
  // is exactly 280×210; surrounding white padding and dashed rim are the host.
  const stage = {x:31,y:25,w:653,h:490};
  let paused=false, previous=0, accumulator=0;
  function render() {
    const ratio=Math.min(window.devicePixelRatio || 1,3);
    if(canvas.width!==Math.round(742*ratio)) {
      canvas.width=Math.round(742*ratio); canvas.height=Math.round(550*ratio);
    }
    ctx.setTransform(ratio,0,0,ratio,0,0);
    ctx.clearRect(0,0,742,550);
    ctx.fillStyle='#282828'; ctx.fillRect(0,0,742,550);
    ctx.beginPath(); ctx.roundRect(9,9,698,523,12); ctx.fillStyle='#fff'; ctx.fill();
    ctx.setLineDash([5,4]); ctx.lineWidth=2; ctx.strokeStyle='#b7b7b7'; ctx.stroke(); ctx.setLineDash([]);
    ctx.save();
    // The SWF stage clips content; retain the boundary stroke up to its edge.
    ctx.beginPath(); ctx.rect(stage.x-1,stage.y-1,stage.w+2,stage.h+2); ctx.clip();
    ctx.translate(stage.x,stage.y); ctx.scale(stage.w/280,stage.h/210);
    root.renderClip(ctx);
    ctx.restore();
  }
  function step(count=1) {
    for(let n=0;n<count;n++) {
      advanceTimers();
      root.onEnterFrame.call(root);
      root.ham.onEnterFrame.call(root.ham);
    }
  }
  function animate(time) {
    if(!paused) {
      accumulator+=Math.min(time-previous,100);
      while(accumulator>=1000/30) { step(); accumulator-=1000/30; }
    }
    previous=time; render(); requestAnimationFrame(animate);
  }
  function pointer(event) {
    const box=canvas.getBoundingClientRect();
    root._xmouse=(event.clientX-box.left)*742/box.width;
    root._ymouse=(event.clientY-box.top)*550/box.height;
    root._xmouse=(root._xmouse-stage.x)*280/stage.w;
    root._ymouse=(root._ymouse-stage.y)*210/stage.h;
  }
  function inStage() { return root._xmouse>=0 && root._xmouse<=280 && root._ymouse>=0 && root._ymouse<=210; }
  const brand=document.getElementById('brand-link');
  // The original TextField uses a URL and target="_top".
  brand.href=root.txt.format.url;
  brand.target=root.txt.format.target;
  brand.style.left=`${(stage.x+(root.txt._x+2)*stage.w/280)/742*100}%`;
  brand.style.top=`${(stage.y+(root.txt._y+2)*stage.h/210)/550*100}%`;
  brand.style.width=`${56*stage.w/280/742*100}%`;
  brand.style.height=`${14*stage.h/210/550*100}%`;
  canvas.addEventListener('pointermove',event=>{
    pointer(event);
    if(inStage() || event.buttons) root.onMouseMove.call(root);
    canvas.style.cursor=Math.hypot(root._xmouse-167,root._ymouse-105)<=10 ? 'pointer' : 'default';
  });
  canvas.addEventListener('pointerdown',event=>{
    if(event.button!==0) return;
    pointer(event);
    if(!inStage()) return;
    canvas.setPointerCapture(event.pointerId);
    root.onMouseMove.call(root);
    root.onMouseDown.call(root);
  });
  function release() { root.onMouseUp.call(root); }
  canvas.addEventListener('pointerup',release);
  canvas.addEventListener('pointercancel',release);
  canvas.addEventListener('lostpointercapture',release);
  window.addEventListener('blur',release);
  document.fonts.ready.then(render);
  // Readable state and deterministic stepping for browser verification.
  window.hamsterApp={root,step,render,stage,get paused(){return paused;},set paused(v){paused=Boolean(v);setManualClock(paused);}};
  step(); render(); requestAnimationFrame(animate);
})();
