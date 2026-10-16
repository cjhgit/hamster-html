class LegV2 extends MovieClip
{
   var base;
   var col;
   var ctrFtPos;
   var debug;
   var ease;
   var fillColor;
   var footColor;
   var frontPt;
   var ftLen;
   var ftPos;
   var jtPos;
   var legLen;
   var mcFill;
   var rearPt;
   var sidePt;
   var tX;
   var tY;
   static var symbolName = "__Packages.LegV2";
   static var symbolLinked = Object.registerClass(LegV2.symbolName,LegV2);
   var angDir = 0;
   var xDist = 0;
   var yDist = 0;
   var angOffset = 0;
   var maxStepDist = 20;
   var maxStepHt = 2;
   var legAng = 1.5707963267948966;
   var maxFtAng = 0.9424777960769379;
   var angAcc = 0.01;
   var angVel = 0;
   var beginX = 0;
   var beginY = 0;
   var time = 0;
   var chX = 0;
   var chY = 0;
   var totTime = 0;
   var currStepHt = 0;
   function LegV2()
   {
      super();
   }
   static function create(parentMC, depth, args)
   {
      var _loc1_ = parentMC.attachMovie(LegV2.symbolName,"LegV2" + depth,depth);
      _loc1_.depth = depth;
      _loc1_.init(args);
      return _loc1_;
   }
   function init(args)
   {
      this.footColor = args.footColor;
      this.ease = this.easeInOutQuad;
      this.ctrFtPos = {};
      this.ftPos = {x:0,y:0};
      this.jtPos = {x:0,y:0};
      if(args.angOffset != undefined)
      {
         this.angOffset = args.angOffset;
      }
      this.legLen = args.legLen;
      this.ftLen = args.footLen;
      this.base = args.base;
      this.frontPt = args.frontPt;
      this.rearPt = args.rearPt;
      this.sidePt = args.sidePt;
      this.mcFill = this.createEmptyMovieClip("mcFill",this.getNextHighestDepth());
      this.col = args.col;
      this.debug = args.debug;
      this.fillColor = args.fillColor;
      this.ctrFtPos.xpos = this.base.xpos + this.legLen * Math.cos(this.legAng);
      this.ctrFtPos.ypos = this.base.ypos + this.legLen * Math.sin(this.legAng);
      this.ftPos.x = 0;
      this.ftPos.y = this.ctrFtPos.ypos;
      this.ftPos.z = 0;
      this.update4({x:0,y:0,z:0},0,0);
      this.render2();
   }
   function update(ang, cosAngDir, sinAngDir, stepDist, stepHt, groundAng)
   {
      this.currStepHt = 0;
      ang += this.angOffset;
      var _loc5_ = Math.cos(ang);
      var _loc4_ = Math.sin(ang);
      this.xDist = cosAngDir * stepDist;
      this.yDist = sinAngDir * stepDist;
      this.ftPos.xpos = _loc5_ * this.xDist;
      this.ctrFtPos.xpos = this.base.xpos + cosAngDir * this.legLen * Math.cos(this.legAng);
      this.ctrFtPos.ypos = this.base.ypos + this.legLen * Math.sin(this.legAng);
      this.ftPos.xpos += this.ctrFtPos.xpos;
      this.ftPos.ypos = Math.min(0,_loc4_ * stepHt);
      this.ftPos.ypos += this.ctrFtPos.ypos;
      var _loc12_ = stepDist / this.maxStepDist;
      var _loc8_ = -3.141592653589793 - this.maxFtAng * Math.min(0,_loc5_) * _loc12_;
      var _loc10_ = this.ftLen * Math.cos(_loc8_) * cosAngDir;
      var _loc9_ = this.ftLen * Math.sin(_loc8_);
      this.jtPos.xpos = _loc10_ + _loc5_ * this.xDist + this.ctrFtPos.xpos;
      this.jtPos.ypos = _loc9_ + this.ftPos.ypos;
      var _loc3_;
      var _loc2_;
      if(groundAng)
      {
         groundAng = Math.atan(cosAngDir * Math.tan(groundAng));
         _loc5_ = Math.cos(groundAng);
         _loc4_ = Math.sin(groundAng);
         _loc3_ = this.ftPos.xpos;
         _loc2_ = this.ftPos.ypos;
         this.ftPos.xpos = _loc5_ * _loc3_ - _loc4_ * _loc2_;
         this.ftPos.ypos = _loc5_ * _loc2_ + _loc4_ * _loc3_;
         _loc3_ = this.jtPos.xpos;
         _loc2_ = this.jtPos.ypos;
         this.jtPos.xpos = _loc5_ * _loc3_ - _loc4_ * _loc2_;
         this.jtPos.ypos = _loc5_ * _loc2_ + _loc4_ * _loc3_;
      }
   }
   function render2(mcBG)
   {
      var _loc2_ = this.jtPos.ypos - this.currStepHt;
      var _loc3_ = this.ftPos.ypos - this.currStepHt;
      this.clear();
      this.beginFill(this.fillColor);
      this.moveTo(this.frontPt.xpos,this.frontPt.ypos);
      this.lineTo(this.jtPos.xpos,_loc2_);
      this.lineTo(this.rearPt.xpos,this.rearPt.ypos);
      this.lineTo(this.sidePt.xpos,this.sidePt.ypos);
      this.lineTo(this.frontPt.xpos,this.frontPt.ypos);
      this.endFill();
      this.lineTo(this.jtPos.xpos,_loc2_);
      this.lineStyle(1,this.col);
      this.moveTo(this.frontPt.xpos,this.frontPt.ypos);
      this.lineTo(this.jtPos.xpos,_loc2_);
      this.mcFill.clear();
      this.mcFill.beginFill(this.fillColor);
      this.mcFill.moveTo(this.frontPt.xpos,this.frontPt.ypos);
      this.mcFill.lineTo(this.jtPos.xpos,_loc2_);
      this.mcFill.lineTo(this.sidePt.xpos,this.sidePt.ypos);
      this.mcFill.lineTo(this.frontPt.xpos,this.frontPt.ypos);
      this.mcFill.endFill();
      this.lineStyle(5,this.col);
      this.moveTo(this.jtPos.xpos,_loc2_);
      if(_loc2_ == _loc3_)
      {
         this.lineTo(this.ftPos.xpos,_loc3_ + 0.5);
      }
      else
      {
         this.lineTo(this.ftPos.xpos,_loc3_);
      }
      this.lineStyle(2,this.footColor);
      this.moveTo(this.jtPos.xpos,_loc2_);
      if(_loc2_ == _loc3_)
      {
         this.lineTo(this.ftPos.xpos,_loc3_ + 0.5);
      }
      else
      {
         this.lineTo(this.ftPos.xpos,_loc3_);
      }
      mcBG.moveTo(this.frontPt.xpos,this.frontPt.ypos);
      mcBG.lineTo(this.jtPos.xpos,_loc2_);
      mcBG.lineTo(this.rearPt.xpos,this.rearPt.ypos);
      mcBG.lineTo(this.jtPos.xpos,_loc2_);
      mcBG.lineTo(this.sidePt.xpos,this.sidePt.ypos);
   }
   function stepTo(pt, d, stepHt)
   {
      this.tX = pt.x;
      this.tY = pt.z;
      this.totTime = d;
      this.beginX = this.ftPos.x;
      this.chX = this.tX - this.beginX;
      this.beginY = this.ftPos.z;
      this.chY = this.tY - this.beginY;
      this.time = 0;
      this.maxStepHt = stepHt;
   }
   function update4(bodyVel, cosAngDir, sinAngDir)
   {
      this.ctrFtPos.xpos = this.base.xpos + cosAngDir * this.legLen * Math.cos(this.legAng);
      this.ctrFtPos.ypos = this.base.ypos + this.legLen * Math.sin(this.legAng);
      if(this.time < this.totTime)
      {
         this.ftPos.x = this.ease(this.time++,this.beginX,this.chX,this.totTime);
         this.ftPos.z = this.ease(this.time,this.beginY,this.chY,this.totTime);
         this.currStepHt = this.maxStepHt * Math.sin(this.time / this.totTime * 3.141592653589793);
      }
      else
      {
         this.ftPos.x -= bodyVel.x;
         this.ftPos.z -= bodyVel.z;
      }
      this.ftPos.xpos = this.ctrFtPos.xpos + cosAngDir * this.ftPos.x + sinAngDir * this.ftPos.z;
      this.ftPos.ypos = this.ctrFtPos.ypos - this.currStepHt;
      var _loc6_ = Math.min(this.ftPos.x,0) / this.maxStepDist;
      var _loc2_ = -3.141592653589793 - this.maxFtAng * _loc6_;
      var _loc5_ = this.ftLen * Math.cos(_loc2_) * cosAngDir;
      var _loc4_ = this.ftLen * Math.sin(_loc2_);
      this.jtPos.xpos = _loc5_ + this.ftPos.xpos;
      this.jtPos.ypos = _loc4_ + this.ftPos.ypos;
   }
   function updateLeg(cosAngDir, sinAngDir, ftAng)
   {
      this.ctrFtPos.xpos = this.base.xpos + cosAngDir * this.legLen * Math.cos(this.legAng);
      this.ctrFtPos.ypos = this.base.ypos + this.legLen * Math.sin(this.legAng);
      this.ftPos.xpos = this.ctrFtPos.xpos + cosAngDir * this.ftPos.x + sinAngDir * this.ftPos.z;
      this.ftPos.ypos = this.ctrFtPos.ypos - this.currStepHt;
      var _loc4_ = this.ftLen * Math.cos(ftAng) * cosAngDir;
      var _loc3_ = this.ftLen * Math.sin(ftAng);
      this.jtPos.xpos = _loc4_ + this.ftPos.xpos;
      this.jtPos.ypos = _loc3_ + this.ftPos.ypos;
      this.ftPos.x += (- this.ftPos.x) * 0.3;
      this.ftPos.z += (- this.ftPos.z) * 0.3;
      this.currStepHt += (- this.currStepHt) * 0.3;
   }
   function moveOval(ang, cosAngDir, sinAngDir, radiusW, radiusH, ftAng)
   {
      this.ctrFtPos.xpos = this.base.xpos + cosAngDir * this.legLen * Math.cos(this.legAng);
      this.ctrFtPos.ypos = this.base.ypos + this.legLen * Math.sin(this.legAng);
      this.ftPos.x = Math.cos(ang) * radiusW;
      this.ftPos.y = Math.sin(ang) * radiusW;
      this.ftPos.xpos = this.ctrFtPos.xpos + cosAngDir * this.ftPos.x + sinAngDir * this.ftPos.z;
      this.ftPos.ypos = this.ctrFtPos.ypos + this.ftPos.y;
      var _loc4_ = this.ftLen * Math.cos(ftAng) * cosAngDir;
      var _loc3_ = this.ftLen * Math.sin(ftAng);
      this.jtPos.xpos = _loc4_ + this.ftPos.xpos;
      this.jtPos.ypos = _loc3_ + this.ftPos.ypos;
   }
   function easeInOutQuad(t, b, c, d)
   {
      if((t /= d / 2) < 1)
      {
         return c / 2 * t * t + b;
      }
      return (- c) / 2 * ((t = t - 1) * (t - 2) - 1) + b;
   }
   function easer(t, b, c, d)
   {
      t /= d;
      return b + c * t;
   }
}
