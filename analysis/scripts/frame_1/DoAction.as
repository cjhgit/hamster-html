function onMouseMove()
{
   mouseActive = true;
   mouseActiveUntil = frameNum + 100;
   ymouse = _ymouse;
   xmouse = Math.max(leftX,_xmouse);
   xmouse = Math.min(rightX,xmouse);
}
function update()
{
   frameNum++;
   if(mouseActiveUntil < frameNum)
   {
      mouseActive = false;
   }
   updateWheel();
   updateFood();
}
function recycleFood(food)
{
   eatenFood.push(food);
   food._visible = false;
   var _loc3_ = freshFood.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(freshFood[_loc1_] == food)
      {
         freshFood.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function pushWheel(hamForce, hamX)
{
   var _loc3_ = hamX - wheel._x;
   wheelVel += _loc3_ * 0.03;
   var _loc1_ = 0.04;
   tarWheelVel = hamForce;
   if(hamForce != 0)
   {
      if(hamForce > wheelVel + _loc1_ * 2)
      {
         wheelVel += _loc1_;
      }
      else if(hamForce < wheelVel - _loc1_ * 2)
      {
         wheelVel -= _loc1_;
      }
      else
      {
         wheelVel = tarWheelVel;
      }
   }
}
function updateWheel()
{
   if(fric > 0.98)
   {
      fricAcc = -0.01;
   }
   else if(fric < 0.94)
   {
      fricAcc = 0.01;
   }
   fric += fricAcc;
   wheelVel *= fric;
   wheelAng += wheelVel * distPerDeg * 0.017453292519943295;
   var _loc2_ = (wheelRadius - 3) * Math.cos(wheelAng);
   var _loc1_ = (wheelRadius - 3) * Math.sin(wheelAng);
   wheelSpokes.clear();
   wheelSpokes.lineStyle(2,wheelSpokeColor);
   wheelSpokes.lineTo(- _loc2_,- _loc1_);
}
function updateFood()
{
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   var _loc1_;
   while(_loc2_ < freshFood.length)
   {
      food = freshFood[_loc2_];
      if(food.drag)
      {
         _loc4_ = food.pos.x;
         _loc3_ = food.pos.y;
         food._x = food.pos.x = Math.max(Math.min(_xmouse,rightX - food.radius),leftX + food.radius);
         food._y = food.pos.y = _ymouse;
         food.vel.x = food.pos.x - _loc4_;
         food.vel.y = food.pos.y - _loc3_;
      }
      else
      {
         _loc5_ = 0.8;
         _loc1_ = 0.3;
         food.vel.y += _loc5_;
         food.pos.y += food.vel.y;
         food.pos.x += food.vel.x;
         if(food.pos.y + food.radius > groundY)
         {
            food.pos.y = groundY - food.radius;
            food.vel.y *= -1;
            food.vel.y *= _loc1_;
            food.vel.x *= groundFric;
         }
         if(food.pos.x < leftX + food.radius)
         {
            food.pos.x = leftX + food.radius;
            food.vel.x *= -1;
            food.vel.x *= _loc1_;
         }
         else if(food.pos.x > rightX - food.radius)
         {
            food.pos.x = rightX - food.radius;
            food.vel.x *= -1;
            food.vel.x *= _loc1_;
         }
         if(food.pos.y < topY + food.radius)
         {
            food.pos.y = topY + food.radius;
            food.vel.y *= -1;
            food.vel.y *= _loc1_;
         }
         food._y = food.pos.y;
         food._x = food.pos.x;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function onMouseUp()
{
   food.drag = false;
}
function onMouseDown()
{
   var _loc1_ = com.abowman.math.Trig.distTo(_xmouse,_ymouse,wheel._x,wheel._y);
   if(_loc1_ <= wheelRadius * 0.1)
   {
      ham.gotoWheel();
      return undefined;
   }
   if(eatenFood.length > 0)
   {
      food = MovieClip(eatenFood.pop());
      food._visible = true;
      freshFood.push(food);
      food.pos.x = food._x = _xmouse;
      food.pos.y = food._y = _ymouse;
      food.drag = true;
   }
}
System.security.allowDomain("bin.clearspring.com");
System.security.allowDomain("widgets.clearspring.com");
var up_waterColor;
var up_foodColor;
var up_bgColor;
var up_wheelColor;
var up_bodyColor;
var up_eyeColor;
var up_earColor;
var up_feetColor;
var up_snoutColor;
var up_wheelOuterColor;
var waterColor;
var foodColor;
var bgColor;
var wheelColor;
var bodyColor;
var eyeColor;
var earColor;
var tailColor;
var feetColor;
var snoutColor;
var wheelOuterColor;
var rightX = 280;
var leftX = 0;
var topY = 0;
var xmouse;
var ymouse;
var wheelSpokeColor;
if(up_tailColor == undefined)
{
   tailColor = 15130302;
}
else
{
   tailColor = parseInt("0x" + up_tailColor);
}
if(up_foodColor == undefined)
{
   foodColor = 13347104;
}
else
{
   foodColor = parseInt("0x" + up_foodColor);
}
if(up_waterColor == undefined)
{
   waterColor = 14741503;
}
else
{
   waterColor = parseInt("0x" + up_waterColor);
}
if(up_bgColor == undefined)
{
   bgColor = 16777215;
}
else
{
   bgColor = parseInt("0x" + up_bgColor);
}
if(up_wheelColor == undefined)
{
   wheelColor = 16777215;
}
else
{
   wheelColor = parseInt("0x" + up_wheelColor);
}
if(up_wheelSpokeColor == undefined)
{
   wheelSpokeColor = 14606046;
}
else
{
   wheelSpokeColor = parseInt("0x" + up_wheelSpokeColor);
}
if(up_bodyColor == undefined)
{
   bodyColor = 15130302;
}
else
{
   bodyColor = parseInt("0x" + up_bodyColor);
}
if(up_eyeColor == undefined)
{
   eyeColor = 0;
}
else
{
   eyeColor = parseInt("0x" + up_eyeColor);
}
if(up_earColor == undefined)
{
   earColor = 13944984;
}
else
{
   earColor = parseInt("0x" + up_earColor);
}
if(up_feetColor == undefined)
{
   feetColor = 13944984;
}
else
{
   feetColor = parseInt("0x" + up_feetColor);
}
if(up_snoutColor == undefined)
{
   snoutColor = 16250089;
}
else
{
   snoutColor = parseInt("0x" + up_snoutColor);
}
if(up_wheelOuterColor == undefined)
{
   wheelOuterColor = 14889522;
}
else
{
   wheelOuterColor = parseInt("0x" + up_wheelOuterColor);
}
if(up_wheelCenterColor == undefined)
{
   wheelCenterColor = 15002415;
}
else
{
   wheelCenterColor = parseInt("0x" + up_wheelCenterColor);
}
var bg = createEmptyMovieClip("bg",getNextHighestDepth());
var wheel = createEmptyMovieClip("wheel",getNextHighestDepth());
var wheelSpokes = wheel.createEmptyMovieClip("spokes",wheel.getNextHighestDepth());
var wheelCenter = wheel.createEmptyMovieClip("center",wheel.getNextHighestDepth());
var wheelRadius = 100;
var distPerDeg = 6.283185307179586 * wheelRadius / 360;
var water = WaterBottle.create(this,getNextHighestDepth(),{w:52,h:125,bottleColor:52479,waterColor:waterColor,capColor:3355443,cornerRadius:5});
var mouseActive;
var mouseActiveUntil;
var frameNum = 0;
water._x = 5;
water._y = 5;
var grav = 0.8;
var groundY = 210;
var groundFric = 0.8;
var sw = 550;
var fricAcc = 0.01;
var fric = 0.98;
bg.lineStyle(2);
bg.beginFill(bgColor);
com.abowman.graphics.Draw.drawRoundRect(bg,leftX,topY,rightX,groundY,5);
bg.endFill();
wheel.lineStyle(6,3355443);
wheel.beginFill(wheelColor);
com.abowman.graphics.Draw.drawOval(wheel,0,0,wheelRadius,wheelRadius);
wheel.endFill();
wheel.lineStyle(3,wheelOuterColor);
com.abowman.graphics.Draw.drawOval(wheel,0,0,wheelRadius,wheelRadius);
wheelCenter.lineStyle(2,3355443);
wheelCenter.beginFill(wheelCenterColor);
com.abowman.graphics.Draw.drawOval(wheelCenter,0,0,wheelRadius * 0.08,wheelRadius * 0.08);
wheelCenter.endFill();
wheel._x = 167;
wheel._y = 105;
var ham = Hamster.create(this,getNextHighestDepth(),{bodyColor:bodyColor,eyeColor:eyeColor,earColor:earColor,feetColor:feetColor,snoutColor:snoutColor,tailColor:tailColor});
var txtFormat = new TextFormat();
txtFormat.size = 14;
txtFormat.font = "Icicle Country 2";
var color = 0;
if(bgColor == color)
{
   color = 16777215;
}
txtFormat.color = color;
txtFormat.url = "http://aBowman.com/google-modules/hamster";
txtFormat.target = "_top";
var aBowman = this;
aBowman.createTextField("txt",aBowman.getNextHighestDepth(),0,0,50,50);
aBowman.txt.antiAliasType = "advanced";
aBowman.txt.gridFitType = "subpixel";
aBowman.txt.autoSize = true;
aBowman.txt.text = "aBowman";
aBowman.txt.embedFonts = true;
aBowman.txt.html = true;
aBowman.txt.setTextFormat(txtFormat);
aBowman.txt._x = 218;
aBowman.txt._y = -1;
wheelCenter.onPress = function()
{
};
ham.groundY = groundY;
ham.tiltHead(-0.47123889803846897);
wheel.force = 0;
var wheelVel = 0;
var tarWheelVel = 0;
var wheelAng = 0;
var getOffWheel;
var getOnWheel;
var food;
var freshFood = new Array();
var eatenFood = new Array();
var totFood = 10;
var waterPos = {};
waterPos.x = water._x + water.spoutX;
waterPos.y = water._y + water.spoutY;
var i = 0;
while(i < totFood)
{
   eatenFood[i] = Food.create(this,this.getNextHighestDepth(),{color:foodColor,radius:4});
   eatenFood[i]._visible = false;
   i++;
}
var activeFood = 0;
var dest = {};
onEnterFrame = update;
