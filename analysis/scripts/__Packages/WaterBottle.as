class WaterBottle extends MovieClip
{
   var bottleColor;
   var capColor;
   var capH;
   var capW;
   var cornerRadius;
   var h;
   var mcBottle;
   var mcCap;
   var mcTube;
   var mcWater;
   var mcWaterMask;
   var spoutX;
   var spoutY;
   var tubeColor;
   var tubeH;
   var tubeW;
   var w;
   var waterColor;
   static var symbolName = "__Packages.WaterBottle";
   static var symbolLinked = Object.registerClass(WaterBottle.symbolName,WaterBottle);
   var lineColor = 0;
   function WaterBottle()
   {
      super();
   }
   static function create(parent, depth, args)
   {
      var _loc1_ = WaterBottle(parent.attachMovie(WaterBottle.symbolName,"WaterBottle" + depth,depth));
      _loc1_.init(args);
      return _loc1_;
   }
   function init(args)
   {
      this.bottleColor = args.bottleColor;
      this.waterColor = args.waterColor;
      this.capColor = args.capColor;
      this.tubeColor = 10066329;
      this.w = args.w;
      this.h = args.h;
      this.capH = this.h / 10;
      this.capW = this.w / 2;
      this.tubeH = 20;
      this.tubeW = 6;
      this.cornerRadius = args.cornerRadius;
      this.mcTube = this.createEmptyMovieClip("mcTube",this.getNextHighestDepth());
      this.mcCap = this.createEmptyMovieClip("mcCap",this.getNextHighestDepth());
      this.mcBottle = this.createEmptyMovieClip("mcBottle",this.getNextHighestDepth());
      this.mcWaterMask = this.createEmptyMovieClip("mcWaterMask",this.getNextHighestDepth());
      this.mcWater = this.createEmptyMovieClip("mcWater",this.getNextHighestDepth());
      this.mcWater.setMask(this.mcWaterMask);
      this.mcCap._y = this.h;
      this.mcCap._x = this.w / 2 - this.capW / 2;
      this.mcTube._x = this.mcCap._x + this.capW * 0.5;
      this.mcTube._y = this.mcCap._y + this.capH * 0.95;
      var _loc3_ = -35;
      this.mcTube._rotation = _loc3_;
      this.spoutY = this.mcTube._y + Math.sin(1.5707963267948966 + _loc3_ * 3.141592653589793 / 180) * this.tubeH;
      this.spoutX = this.mcTube._x + Math.cos(1.5707963267948966 + _loc3_ * 3.141592653589793 / 180) * this.tubeH;
      trace(Math.sin(_loc3_ * 3.141592653589793 / 180) * this.tubeH);
      this.draw();
   }
   function draw()
   {
      this.mcBottle.lineStyle(2,this.lineColor);
      com.abowman.graphics.Draw.drawRoundRect(this.mcBottle,0,0,this.w,this.h,this.cornerRadius);
      this.mcWaterMask.beginFill(this.waterColor);
      com.abowman.graphics.Draw.drawRoundRect(this.mcWaterMask,1,1,this.w - 2,this.h - 2,this.cornerRadius);
      this.mcWaterMask.endFill();
      this.mcWater.beginFill(this.waterColor);
      com.abowman.graphics.Draw.drawRoundRect(this.mcWater,0,0,this.w,this.h,0);
      this.mcWater.endFill();
      this.mcCap.lineStyle(2,this.lineColor);
      this.mcCap.beginFill(this.capColor);
      com.abowman.graphics.Draw.drawRoundRect(this.mcCap,0,0,this.capW,this.capH,0);
      this.mcCap.endFill();
      this.mcTube.lineStyle(2,this.lineColor);
      this.mcTube.beginFill(this.tubeColor);
      com.abowman.graphics.Draw.drawRoundRect(this.mcTube,(- this.tubeW) * 0.5,0,this.tubeW,this.tubeH,0);
      this.mcTube.endFill();
   }
}
