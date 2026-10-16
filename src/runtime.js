// The small part of the Flash 9 MovieClip API used by the original program.
// Paths retain separate fill and stroke geometry (Flash lineStyle can change
// halfway through a fill); all coordinates remain in the original 280×210 stage.
const symbols = new Map();
const registerClass = (name, ctor) => { symbols.set(name,ctor); return true; };
const identity = x => x;
const trace = () => {};
const int = x => Math.trunc(x);
const com = {abowman:{math:{},graphics:{}}};
const Stage = {width:280,height:210};
const System = {security:{allowDomain(){}}};
// Virtual timers advance with the original 30 fps timeline, including in tests.
const flashTimers = new Map();
let flashTime = 0, timerId = 0;
function scheduleFlash(target, method, delay, repeat=false) {
  const id = ++timerId;
  flashTimers.set(id,{target,method,at:flashTime + delay,delay,repeat});
  return id;
}
const _global = {
  setTimeout: (o,m,d) => scheduleFlash(o,m,d),
  clearTimeout: id => flashTimers.delete(id)
};
function setInterval(o,m,d) { return scheduleFlash(o,m,d,true); }
function advanceTimers() {
  flashTime += 1000 / 30;
  for(const [id,t] of [...flashTimers]) if(t.at <= flashTime) {
    if(t.repeat) t.at += t.delay; else flashTimers.delete(id);
    t.target[t.method]();
  }
}
function color(value=0,alpha=100) {
  value = Number(value) || 0;
  return `rgba(${value>>16&255},${value>>8&255},${value&255},${alpha/100})`;
}
class MovieClip {
  constructor() {
    this._x = this._y = this._rotation = 0;
    this._xscale = this._yscale = this._alpha = 100;
    this._visible = true;
    this.children = [];
    this.clear();
  }
  add(child,name,depth) {
    const old = this.children.find(c=>c._depth===depth);
    if(old) old.removeMovieClip();
    child._parent=this; child._name=name; child._depth=depth;
    this.children.push(child); this[name]=child;
    return child;
  }
  createEmptyMovieClip(name,depth) { return this.add(new MovieClip(),name,depth); }
  attachMovie(symbol,name,depth) { return this.add(new (symbols.get(symbol))(),name,depth); }
  createTextField(name,depth) { return this.add(new FlashText(),name,depth); }
  getNextHighestDepth() { return this.children.reduce((d,c)=>Math.max(d,c._depth+1),0); }
  getDepth() { return this._depth; }
  swapDepths(other) {
    if(typeof other==='number') other=this._parent.children.find(c=>c._depth===other) || {_depth:other};
    [this._depth,other._depth]=[other._depth,this._depth];
  }
  removeMovieClip() {
    if(!this._parent) return;
    this._parent.children=this._parent.children.filter(c=>c!==this);
    if(this._parent[this._name]===this) delete this._parent[this._name];
    this._removed=true;
  }
  setMask(mask) { this.mask=mask; mask.isMask=true; }
  clear() {
    this.fills=[]; this.strokes=[]; this.fill=null; this.stroke=null;
    this.pen={x:0,y:0}; this.strokeStyle=null;
    this.bounds={minX:Infinity,minY:Infinity,maxX:-Infinity,maxY:-Infinity};
  }
  lineStyle(width,col=0,alpha=100) {
    this.strokeStyle=width===undefined ? null : {width:width || 0.05,color:color(col,alpha)};
    this.stroke=null;
  }
  beginFill(col,alpha=100) {
    this.fill={path:new Path2D(),color:color(col,alpha)};
    this.fills.push(this.fill);
  }
  endFill() { this.fill=null; }
  point(x,y) {
    if(!Number.isFinite(x)||!Number.isFinite(y)) return false;
    this.bounds.minX=Math.min(this.bounds.minX,x); this.bounds.minY=Math.min(this.bounds.minY,y);
    this.bounds.maxX=Math.max(this.bounds.maxX,x); this.bounds.maxY=Math.max(this.bounds.maxY,y);
    return true;
  }
  moveTo(x,y) {
    if(!this.point(x,y)) return;
    this.pen={x,y};
    if(this.fill) this.fill.path.moveTo(x,y);
    if(this.stroke) this.stroke.path.moveTo(x,y);
  }
  segment(method,coords,x,y) {
    if(!coords.every(Number.isFinite)) return;
    if(this.fill) this.fill.path[method](...coords);
    if(this.strokeStyle) {
      if(!this.stroke) {
        this.stroke={path:new Path2D(),...this.strokeStyle};
        this.stroke.path.moveTo(this.pen.x,this.pen.y);
        this.strokes.push(this.stroke);
      }
      this.stroke.path[method](...coords);
    }
    this.point(x,y); this.pen={x,y};
  }
  lineTo(x,y) { this.segment('lineTo',[x,y],x,y); }
  curveTo(cx,cy,x,y) { this.segment('quadraticCurveTo',[cx,cy,x,y],x,y); }
  get _width() { return Number.isFinite(this.bounds.minX) ? this.bounds.maxX-this.bounds.minX : 0; }
  get _height() { return Number.isFinite(this.bounds.minY) ? this.bounds.maxY-this.bounds.minY : 0; }
  renderClip(ctx) {
    if(!this._visible || this.isMask || this._removed) return;
    ctx.save();
    ctx.translate(this._x,this._y); ctx.rotate(this._rotation*Math.PI/180);
    ctx.scale(this._xscale/100,this._yscale/100); ctx.globalAlpha*=this._alpha/100;
    if(this.mask) {
      const p = new Path2D();
      for(const f of this.mask.fills) p.addPath(f.path,new DOMMatrix().translate(this.mask._x,this.mask._y));
      ctx.clip(p);
    }
    for(const f of this.fills) { ctx.fillStyle=f.color; ctx.fill(f.path,'evenodd'); }
    ctx.lineCap='round'; ctx.lineJoin='round';
    for(const s of this.strokes) { ctx.strokeStyle=s.color; ctx.lineWidth=s.width; ctx.stroke(s.path); }
    if(this instanceof FlashText) this.drawText(ctx);
    for(const c of [...this.children].sort((a,b)=>a._depth-b._depth)) c.renderClip(ctx);
    ctx.restore();
  }
}
class TextFormat {}
class FlashText extends MovieClip {
  setTextFormat(format) { this.format=format; }
  drawText(ctx) {
    const f=this.format;
    ctx.fillStyle=color(f.color); ctx.font=`${f.size}px "${f.font}"`;
    // Flash TextField includes a font ascent inset beyond its 2 px gutter.
    ctx.textBaseline='top'; ctx.fillText(this.text,2,5);
  }
}
