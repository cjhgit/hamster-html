class Hamster extends MovieClip
{
   var app;
   var bottomDepth;
   var cageLeft;
   var cageRight;
   var cleaning;
   var depth2;
   var dest;
   var drinkStartAt;
   var drinking;
   var eating;
   var eyesClosed;
   var food;
   var foodDepth;
   var getOffWheel;
   var getOnWheel;
   var goingTo;
   var gotoRandomAt;
   var groundY;
   var hiEarDepth1;
   var hiEarDepth2;
   var hiHeadDepth;
   var isTired;
   var legAngF;
   var legAngR;
   var legFL;
   var legFR;
   var legQuad;
   var legRL;
   var legRR;
   var legs;
   var lookHere;
   var lookPt;
   var lowEarDepth1;
   var lowEarDepth2;
   var lowHeadDepth;
   var mcBody;
   var mcEar1;
   var mcEar2;
   var mcEye1;
   var mcEye2;
   var mcFaceUpperL;
   var mcFaceUpperR;
   var mcHead;
   var mcHeadCrown;
   var mcHeadHiDepth1;
   var mcHeadHiDepth2;
   var mcHeadX;
   var mcHeadZ;
   var mcHiDepth1;
   var mcHiDepth2;
   var mcLines;
   var mcMouthL;
   var mcMouthR;
   var mcSegB;
   var mcTail;
   var midHandPt;
   var mouthPt;
   var onEnterFrame;
   var restAt;
   var runAt;
   var sleepAtDest;
   var sleepID;
   var sleeping;
   var sniffing;
   var stopCleanAt;
   var stopDrinkAt;
   var tailColor;
   var tarWheelAng;
   var wheelClicked;
   static var NOTHING = 0;
   static var WHEEL = 1;
   static var FOOD = 2;
   static var RANDOM = 3;
   static var MOUSE = 4;
   static var WATER = 5;
   static var symbolName = "__Packages.Hamster";
   static var symbolLinked = Object.registerClass(Hamster.symbolName,Hamster);
   var wheelAng = 0.15707963267948966;
   var ang = 0;
   var angVel = 0;
   var legVel = 0;
   var headAng = 0;
   var radiusA = 20;
   var radiusB = 20;
   var headAngZ = 0;
   var eyePt = {x:20,y:-4};
   var earPt = {x:10,y:-15};
   var snoutPt = {x:33,y:6};
   var tailPos = {x:-38,y:8,z:0,ox:-38,oy:8};
   var headPos = {x:19,y:-3,z:0,ox:19,oy:-3};
   var legBaseFR = {x:15,y:12,z:-20,ox:15,oy:25};
   var legBaseFL = {x:15,y:12,z:20,ox:15,oy:25};
   var legBaseRR = {x:-25,y:12,z:-20,ox:-25};
   var legBaseRL = {x:-25,y:12,z:20,ox:-25};
   var legInnerR = {x:-10,y:18,z:0,ox:-10,oy:18};
   var midChestPt = {x:0,y:17,z:0,ox:0,oy:17};
   var rearPt = {x:-39,y:-3,z:0,ox:-39,oy:-3};
   var frontInRightPt = {x:20,y:10,z:-5,ox:20,oy:10};
   var frontInLeftPt = {x:20,y:10,z:5,ox:20,oy:10};
   var frontRightPt = {x:15,y:6,z:-18,ox:15,oy:5};
   var frontLeftPt = {x:15,y:6,z:18,ox:15,oy:5};
   var rearRightPt = {x:-20,y:0,z:-20};
   var rearLeftPt = {x:-20,y:0,z:20};
   var frontBodyPt = {x:12,y:-2,z:0,ox:12,oy:-2};
   var rearBodyPt = {x:-20,y:1,z:0,ox:-20,oy:1};
   var eyeGap = 9;
   var earGap = 10;
   var cheekGap = 8;
   var ear1Top = true;
   var ear2Top = true;
   var topEye = 2;
   var mouthOnTop = false;
   var fillColor = 15658734;
   var bodyColor = 14540253;
   var standToAng = 6.283185307179586;
   var walkAng = 6.283185307179586;
   var stepHt = 0;
   var maxStepDist = 20;
   var maxStepHt = 4;
   var maxLegVel = 0.9;
   var vy = 0;
   var vx = 0;
   var ht = 28;
   var legNum = 0;
   var numLegs = 4;
   var frameNum = 0;
   var stepTime = 6;
   var walkWait = 3;
   var num0Strides = 0;
   var grav = 1;
   var eatStandAng = 5.1;
   var maxChewAng = 0.02;
   var chewAng = 0;
   var chewVel = 0;
   var chewAcc = 0.04;
   var startSniffAt = 0;
   var stopSniffAt = 0;
   var maxSniff = 100;
   var waterLevel = 10;
   var isStanding = false;
   var isOnWheel = false;
   var handZ = 20;
   var minEatTime = 1000;
   var maxEatTime = 3000;
   var lookRandomAt = 0;
   var maxLookRandom = 100;
   var minLookRandom = 30;
   var maxGotoRandom = 500;
   var minGotoRandom = 100;
   var foodInMouth = false;
   var neckLen = 5;
   var outlineWidth = 3;
   var maxDrink = 200;
   var minDrink = 60;
   var maxRun = 600;
   var minRun = 300;
   var maxRest = 100;
   var minRest = 30;
   var hamAcc = 0.03;
   var maxHamVel = 0.8;
   var angAcc = 0;
   var maxAngAcc = 0.01;
   var angChance = 4;
   var dir = 1;
   var hamVelToForce = 15;
   var minClean = 30;
   var maxClean = 90;
   var minWait = 300;
   var maxWait = 900;
   var legCleanAng = 0;
   var legCleanVel = 0;
   var rearBounce = 0;
   var frontBounce = 0;
   var headBounce = 0;
   var eyesCloseFrac = 0;
   var sleepInterval = 300000;
   function Hamster()
   {
      super();
   }
   static function create(parentMC, depth, args)
   {
      var _loc1_ = parentMC.attachMovie(Hamster.symbolName,"Hamster" + depth,depth);
      _loc1_.app = parentMC;
      _loc1_.depth = depth;
      _loc1_.init(args);
      return _loc1_;
   }
   function init(args)
   {
      this.cageRight = this.app.rightX;
      this.cageLeft = this.app.leftX;
      var _loc26_;
      var _loc8_;
      var _loc6_;
      var _loc2_;
      var _loc9_;
      var _loc5_;
      var _loc10_;
      _loc8_ = args.eyeColor;
      _loc6_ = args.earColor;
      _loc9_ = args.snoutColor;
      this.tailColor = args.tailColor;
      trace("earColor=" + _loc6_);
      var _loc0_;
      _loc10_ = _loc5_ = this.bodyColor = args.bodyColor;
      this.groundY = this.app.groundY;
      _loc2_ = args.feetColor;
      this.lookHere = {};
      this.midHandPt = {};
      this.mouthPt = {};
      this.lowEarDepth1 = this.getNextHighestDepth();
      this.lowEarDepth2 = this.getNextHighestDepth() + 1;
      this.mcLines = this.createEmptyMovieClip("mcLines",this.getNextHighestDepth() + 2);
      this.lowHeadDepth = this.getNextHighestDepth() + 3;
      var _loc3_ = _loc10_;
      var _loc11_ = 13;
      this.mcBody = this.createEmptyMovieClip("mcBody",this.getNextHighestDepth());
      this.updateLegs(1,0);
      this.legFL = LegV2.create(this,this.getNextHighestDepth() + 4,{legLen:_loc11_,footLen:3,footColor:_loc2_,fillColor:_loc3_,col:0,base:this.legBaseFL,frontPt:this.frontInLeftPt,rearPt:this.midChestPt,sidePt:this.frontLeftPt,len:0,angOffset:3.141592653589793,front:true});
      this.legFR = LegV2.create(this,this.getNextHighestDepth(),{legLen:_loc11_,footLen:3,footColor:_loc2_,fillColor:_loc3_,col:0,base:this.legBaseFR,frontPt:this.frontInRightPt,rearPt:this.midChestPt,sidePt:this.frontRightPt,len:0,angOffset:0,front:true});
      this.foodDepth = this.getNextHighestDepth() + 1;
      this.legRL = LegV2.create(this,this.getNextHighestDepth() + 2,{legLen:_loc11_,footLen:12,footColor:_loc2_,fillColor:_loc3_,col:0,base:this.legBaseRL,frontPt:this.legInnerR,sidePt:this.rearLeftPt,rearPt:this.rearPt,len:0,angOffset:1.5707963267948966});
      this.legRR = LegV2.create(this,this.getNextHighestDepth(),{legLen:_loc11_,footLen:12,footColor:_loc2_,fillColor:_loc3_,col:0,base:this.legBaseRR,frontPt:this.legInnerR,sidePt:this.rearRightPt,rearPt:this.rearPt,len:0,angOffset:4.71238898038469});
      var _loc7_ = 1.5707963267948966;
      this.legRR.legAng = this.legRL.legAng = this.legAngF = _loc7_;
      this.legFR.legAng = this.legFL.legAng = this.legAngR = _loc7_;
      this.ht = this.legBaseFR.y + 2 + Math.sin(_loc7_) * _loc11_;
      this.legs = new Array();
      this.legs.push(this.legRR);
      this.legs.push(this.legFR);
      this.legs.push(this.legRL);
      this.legs.push(this.legFL);
      this.legs[0].num = 0;
      this.legs[1].num = 1;
      this.legs[2].num = 2;
      this.legs[3].num = 3;
      this.mcTail = this.mcBody.createEmptyMovieClip("mcTail",this.mcBody.getNextHighestDepth());
      this.mcSegB = this.mcBody.createEmptyMovieClip("mcSegB",this.mcBody.getNextHighestDepth());
      this.mcHead = this.createEmptyMovieClip("mcHead",this.getNextHighestDepth() + 20);
      this.mcHeadCrown = this.mcHead.createEmptyMovieClip("mcHeadCrown",this.mcHead.getNextHighestDepth());
      this.mcHeadCrown._y = 0;
      this.mcHeadCrown.beginFill(this.bodyColor);
      com.abowman.graphics.Draw.drawOval(this.mcHeadCrown,0,0,15,15);
      this.mcHeadCrown.endFill();
      this.hiHeadDepth = this.mcHead.getDepth();
      this.mcHeadZ = this.createHeadYZ(this.mcHead,-20,-16,40,29,_loc5_);
      this.mcHeadZ.trans({x:5,y:0,z:0});
      this.bottomDepth = this.mcHeadZ.getDepth();
      this.mcMouthR = this.createMouthSide(this.mcHead,this.mcHead.getNextHighestDepth(),1,_loc9_);
      this.mcFaceUpperR = this.createFaceUpperSide(this.mcHead,this.mcHead.getNextHighestDepth(),1,_loc5_);
      this.mcEye1 = this.createEye(this.mcHead,this.mcHead.getNextHighestDepth(),_loc8_);
      this.mcEye1.rotateX(-0.15707963267948966);
      this.mcEye1.rotateY(-0.47123889803846897);
      this.mcEye1.scale(1.3);
      this.mcEar1 = this.createHamsterearPt(this,this.getNextHighestDepth() + 10,16,16,1,_loc6_);
      this.mcEar1.rotateZ(-0.7853981633974483);
      this.mcEar1.rotateY(-0.7853981633974483);
      this.mcEar1.scale(0.7);
      this.mcHeadX = this.createHeadXY(this.mcHead,35,40,_loc5_);
      this.mcHeadX.scale(0.6);
      this.mcHeadX.trans({x:0,y:2,z:0});
      this.mcMouthL = this.createMouthSide(this.mcHead,this.mcHead.getNextHighestDepth(),-1,_loc9_);
      this.mcFaceUpperL = this.createFaceUpperSide(this.mcHead,this.mcHead.getNextHighestDepth(),-1,_loc5_);
      this.mcEye2 = this.createEye(this.mcHead,this.mcHead.getNextHighestDepth(),_loc8_);
      this.mcEye2.rotateX(0.15707963267948966);
      this.mcEye2.rotateY(0.47123889803846897);
      this.mcEye2.scale(1.3);
      this.depth2 = this.mcHead.getNextHighestDepth();
      this.mcEar2 = this.createHamsterearPt(this,this.getNextHighestDepth() + 1,16,16,-1,_loc6_);
      this.mcEar2.rotateZ(-0.7853981633974483);
      this.mcEar2.rotateY(0.7853981633974483);
      this.mcEar2.scale(0.7);
      this.hiEarDepth1 = this.mcEar1.getDepth();
      this.hiEarDepth2 = this.mcEar2.getDepth();
      this.mcHead._y = 0;
      this.tiltHead(0);
      this.onEnterFrame = this.update;
      setInterval(this,"randomStumble",3000);
      this.mcHiDepth1 = this.createEmptyMovieClip("mcHiDepth1",this.getNextHighestDepth());
      this.mcHiDepth2 = this.createEmptyMovieClip("mcHiDepth2",this.getNextHighestDepth());
      this.mcHeadHiDepth1 = this.mcHead.createEmptyMovieClip("mcHeadHiDepth1",this.mcHead.getNextHighestDepth());
      this.mcHeadHiDepth2 = this.mcHead.createEmptyMovieClip("mcHeadHiDepth2",this.mcHead.getNextHighestDepth());
      if(Math.random() > 0.5)
      {
         this._y = this.groundY - this.ht;
         this._x = this.app.wheel._x + Math.random() * this.app.wheelRadius * 2;
         this.isOnWheel = true;
         this.ang = 3.141592653589793;
      }
      else
      {
         this._y = this.groundY - this.ht;
         this._x = 50 + Math.random() * 200;
         this.ang = Math.random() * 3.141592653589793;
         this.getRandomDest();
      }
      trace("mcEye1.opoints[1].y=" + this.mcEye1.opoints[1].y);
      trace("mcEye1.opoints[1].y=" + this.mcEye1.opoints[1].y);
      this.blink();
   }
   function blink()
   {
      this.closeEyes();
      _global.setTimeout(this,"blink",5000 + Math.random() * 30000);
   }
   function closeEyes()
   {
      this.eyesClosed = true;
   }
   function sleep()
   {
      this.sleeping = true;
      this.closeEyes();
   }
   function wakeUp()
   {
      this.eyesClosed = false;
      this.sleeping = false;
      this.sleepAtDest = false;
   }
   function goToSleep()
   {
      this.getRandomDest();
      this.sleepAtDest = true;
      if(this.isOnWheel)
      {
         this.getOffWheel = true;
      }
   }
   function randomStumble()
   {
      if(Math.random() > 0.5)
      {
         this.legVel *= Math.random();
      }
   }
   function lookForFood()
   {
      var _loc8_ = -1000;
      var _loc7_ = 1000;
      var _loc12_ = 50;
      var _loc11_ = this.ang + this.headAng;
      if(_loc11_ < 0.7853981633974483)
      {
         _loc8_ = this._x - _loc12_;
      }
      else if(_loc11_ > 2.356194490192345)
      {
         _loc7_ = this._x + _loc12_;
      }
      var _loc5_ = this.app.freshFood;
      var _loc10_ = _loc5_.length;
      var _loc9_;
      var _loc3_;
      var _loc4_;
      var _loc6_ = 1000;
      var _loc2_ = 0;
      while(_loc2_ < _loc10_)
      {
         _loc3_ = _loc5_[_loc2_]._x;
         if(_loc3_ > _loc8_ && _loc3_ < _loc7_)
         {
            _loc4_ = Math.abs(_loc3_ - this._x);
            if(_loc4_ < _loc6_)
            {
               _loc9_ = _loc5_[_loc2_];
               _loc6_ = _loc4_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc9_ != undefined)
      {
         this.gotoFood(_loc9_);
      }
   }
   function gotoWheel()
   {
      if(!this.isOnWheel)
      {
         this.getOnWheel = true;
         this.wheelClicked = true;
      }
   }
   function gotoFood(food)
   {
      this.food = food;
      this.dest = food.pos;
      this.goingTo = Hamster.FOOD;
   }
   function setHeadAng(a)
   {
      this.headAng = a;
   }
   function drawTail(mc, x, y, w, h, ang, fillColor)
   {
      var _loc2_ = {x:0,y:h / 2};
      var _loc3_ = {x:- w,y:0};
      var _loc10_;
      var _loc9_;
      var _loc7_;
      var _loc6_;
      if(ang != 0 && ang != undefined)
      {
         _loc10_ = Math.cos(ang);
         _loc9_ = Math.sin(ang);
         _loc7_ = _loc2_.x;
         _loc6_ = _loc2_.y;
         _loc2_.x = _loc10_ * _loc7_ - _loc9_ * _loc6_;
         _loc2_.y = _loc10_ * _loc6_ + _loc9_ * _loc7_;
         _loc7_ = _loc3_.x;
         _loc6_ = _loc3_.y;
         _loc3_.x = _loc10_ * _loc7_ - _loc9_ * _loc6_;
         _loc3_.y = _loc10_ * _loc6_ + _loc9_ * _loc7_;
      }
      mc.clear();
      mc.beginFill(fillColor);
      mc.moveTo(_loc2_.x + x,_loc2_.y + y);
      mc.lineTo(_loc3_.x + x,_loc3_.y + y);
      mc.lineTo(- _loc2_.x + x,- _loc2_.y + y);
      mc.endFill();
      this.mcLines.moveTo(_loc2_.x + x,_loc2_.y + y);
      this.mcLines.lineTo(_loc3_.x + x,_loc3_.y + y);
      this.mcLines.lineTo(- _loc2_.x + x,- _loc2_.y + y);
   }
   function createEye(mc, depth, fillColor)
   {
      var _loc4_ = new Array();
      _loc4_.push({x:3,y:0,z:0});
      _loc4_.push({x:0,y:-5.5,z:0,curve:true});
      _loc4_.push({x:-3,y:0,z:0});
      _loc4_.push({x:0,y:5,z:0,curve:true});
      return HamsterPart.create(mc,depth,{points:_loc4_,fillColor:fillColor,lineColor:fillColor});
   }
   function createHamsterearPt(mc, depth, w, h, side, fillColor)
   {
      var _loc3_ = new Array();
      _loc3_.push({x:0,y:0,z:0});
      _loc3_.push({x:0,y:-11,z:0});
      _loc3_.push({x:0,y:-18,z:0,curve:true});
      _loc3_.push({x:-9,y:-18,z:0});
      _loc3_.push({x:-18,y:-18,z:0,curve:true});
      _loc3_.push({x:-18,y:-9,z:0});
      _loc3_.push({x:-17,y:-2,z:0,curve:true});
      _loc3_.push({x:-12,y:0,z:0});
      return HamsterPart.create(mc,depth,{points:_loc3_,fillColor:fillColor});
   }
   function createMouthSide(mcHead, depth, side, fillColor)
   {
      var _loc1_ = new Array();
      _loc1_.push({x:-1,y:-5,z:side * 3,lineColor:3355443});
      _loc1_.push({x:2,y:-4,z:0});
      _loc1_.push({x:0,y:3,z:0});
      _loc1_.push({x:-8,y:6,z:0,lineColor:fillColor});
      _loc1_.push({x:-30,y:5,z:side * 8});
      _loc1_.push({x:-25,y:0,z:side * 15});
      _loc1_.push({x:-10,y:0,z:side * 8});
      _loc1_.push({x:-1,y:-5,z:side * 3});
      return HamsterPart.create(mcHead,depth,{points:_loc1_,fillColor:fillColor});
   }
   function createFaceUpperSide(mcHead, depth, side, fillColor)
   {
      var _loc1_ = new Array();
      _loc1_.push({x:0,y:-8,z:0});
      _loc1_.push({x:-8,y:-16,z:0});
      _loc1_.push({x:-30,y:-18,z:side * 15});
      _loc1_.push({x:-25,y:0,z:side * 15});
      _loc1_.push({x:-10,y:0,z:side * 8});
      _loc1_.push({x:0,y:-8,z:0});
      return HamsterPart.create(mcHead,depth,{points:_loc1_,fillColor:fillColor});
   }
   function createHeadXY(mcHead, nh, nw, fillColor)
   {
      var _loc4_ = new Array();
      _loc4_.push({x:10,y:-31,z:0});
      _loc4_.push({x:32,y:-31,z:0,curve:true});
      _loc4_.push({x:45,y:-18,z:0});
      _loc4_.push({x:58,y:-4,z:undefined});
      _loc4_.push({x:59,y:3,z:0});
      _loc4_.push({x:54,y:13,z:0});
      _loc4_.push({x:37,y:19,z:0});
      _loc4_.push({x:14,y:20,z:undefined});
      return HamsterPart.create(mcHead,mcHead.getNextHighestDepth(),{points:_loc4_,fillColor:fillColor});
   }
   function createHeadYZ(mcHead, nx, ny, nw, nh, fillColor)
   {
      var _loc3_ = new Array();
      _loc3_.push({x:0,y:11,z:-8});
      _loc3_.push({x:0,y:6,z:-15});
      _loc3_.push({x:0,y:0,z:-18});
      _loc3_.push({x:0,y:-9,z:-15});
      _loc3_.push({x:0,y:-14,z:-8});
      _loc3_.push({x:0,y:-15,z:0});
      _loc3_.push({x:0,y:-14,z:8});
      _loc3_.push({x:0,y:-9,z:15});
      _loc3_.push({x:0,y:0,z:18});
      _loc3_.push({x:0,y:6,z:15});
      _loc3_.push({x:0,y:11,z:9});
      _loc3_.push({x:0,y:14,z:0});
      _loc3_.push({x:0,y:11,z:-8});
      return HamsterPart.create(mcHead,mcHead.getNextHighestDepth(),{points:_loc3_,fillColor:fillColor});
   }
   function createHeadXZ(mcHead, nx, ny, nw, nh, fillColor)
   {
      var _loc3_ = new Array();
      _loc3_.push({x:6,y:0,z:-18});
      _loc3_.push({x:28,y:0,z:-6});
      _loc3_.push({x:32,y:0,z:-3});
      _loc3_.push({x:35,y:0,z:0});
      _loc3_.push({x:32,y:0,z:3});
      _loc3_.push({x:28,y:0,z:6});
      _loc3_.push({x:6,y:0,z:18});
      return HamsterPart.create(mcHead,mcHead.getNextHighestDepth(),{points:_loc3_,fillColor:fillColor});
   }
   function eatFood()
   {
      var _loc2_;
      if(this.foodInMouth)
      {
         this.food._x = this.mouthPt.x - this._x;
         this.food._y = this.mouthPt.y - this._y;
         _loc2_ = com.abowman.math.Trig.distTo(this.midHandPt.x - this._x,this.midHandPt.y - this._y,this.food._x,this.food._y);
         if(_loc2_ < 5)
         {
            this.foodInMouth = false;
         }
      }
      else
      {
         this.food._x = this.midHandPt.x - this._x;
         this.food._y = this.midHandPt.y - this._y;
         this.nodHead();
      }
      this.eating = true;
   }
   function nodHead(ang, acc)
   {
      if(acc == undefined)
      {
         acc = this.chewAcc;
      }
      if(ang == undefined)
      {
         ang = this.maxChewAng;
      }
      if(this.chewAng > ang)
      {
         this.chewVel -= acc;
      }
      else
      {
         this.chewVel += acc;
      }
      this.chewAng += this.chewVel;
   }
   function sniffFood()
   {
      if(this.sniffing)
      {
         this.nodHead();
         if(this.stopSniffAt <= this.frameNum)
         {
            this.sniffing = false;
            this.startSniffAt = this.frameNum + int(Math.random() * this.maxSniff);
         }
      }
      else if(this.startSniffAt <= this.frameNum)
      {
         this.sniffing = true;
         this.stopSniffAt = this.frameNum + int(Math.random() * this.maxSniff);
      }
   }
   function lookRandom()
   {
      if(this.lookRandomAt == undefined)
      {
         this.lookRandomAt = this.frameNum + this.minLookRandom + int(Math.random() * this.maxLookRandom);
      }
      var _loc2_;
      var _loc3_;
      if(this.lookRandomAt <= this.frameNum)
      {
         _loc2_ = 40;
         _loc3_ = this._x - _loc2_ / 2;
         if(this.ang < 0.7853981633974483)
         {
            _loc3_ = this._x;
         }
         else if(this.ang > 2.356194490192345)
         {
            _loc2_ = this._x - _loc2_;
         }
         this.lookRandomAt = this.frameNum + this.minLookRandom + int(Math.random() * this.maxLookRandom);
         this.lookHere.x = _loc3_ + _loc2_ * Math.random();
         this.lookHere.y = this._y - 50 * Math.random();
      }
   }
   function gotoRandom()
   {
      if(this.gotoRandomAt == undefined)
      {
         this.gotoRandomAt = this.frameNum + this.minGotoRandom + int(Math.random() * (this.maxGotoRandom - this.minGotoRandom));
      }
      if(this.gotoRandomAt < this.frameNum)
      {
         this.getRandomDest();
      }
   }
   function getRandomDest()
   {
      trace("getRandomDest");
      this.dest = {};
      var _loc2_ = 300;
      if(this._x < _loc2_ / 2)
      {
         this.dest.x = _loc2_ * 0.5 + Math.random() * _loc2_ * 0.3;
         this.dest.x = Math.max(this._x + 100,this.dest.x);
      }
      else
      {
         this.dest.x = _loc2_ * 0.5 - Math.random() * _loc2_ * 0.3;
         this.dest.x = Math.min(this._x - 100,this.dest.x);
      }
      this.lookHere.y = this.dest.y = this._y;
      this.lookHere.x = this.dest.x;
      this.goingTo = Hamster.RANDOM;
      this.gotoRandomAt = undefined;
   }
   function stopEating()
   {
      this.eating = false;
      this.food.removeMovieClip();
      this.food = undefined;
      this.dest = undefined;
      this.waterLevel -= 2;
   }
   function pickUpFood()
   {
      var _loc3_ = this.food.color;
      var _loc5_ = this.food.radius;
      this.dest = {x:this.food.pos.x,y:this.food.pos.y};
      this.app.recycleFood(this.food);
      this.food = Food.create(this,this.foodDepth,{color:_loc3_,radius:_loc5_});
      if(this.goingTo == Hamster.FOOD)
      {
         this.goingTo = Hamster.NOTHING;
      }
      this.foodInMouth = true;
      this.eatFood();
      _global.setTimeout(this,"stopEating",this.minEatTime + Math.random() * this.maxEatTime);
   }
   function look(lookPt)
   {
      var _loc3_ = this;
      var _loc5_ = _loc3_.mcHead._x + _loc3_._x;
      var _loc10_ = _loc3_.mcHead._y + _loc3_._y;
      var _loc8_ = lookPt.x;
      var _loc7_ = lookPt.y;
      var _loc6_ = Math.abs(_loc8_ - _loc5_);
      var _loc9_ = _loc7_ - _loc10_;
      var _loc2_;
      var _loc4_;
      var _loc12_ = _loc5_ + Math.max(_loc6_,30);
      _loc2_ = com.abowman.math.Trig.angleTo(_loc5_,_loc10_,_loc12_,_loc7_);
      _loc4_ = _loc3_.headAngZ + (_loc2_ - _loc3_.headAngZ) * 0.2;
      _loc3_.tiltHead(_loc4_ + this.chewAng);
      _loc2_ = _loc3_.ang;
      _loc6_ = _loc8_ - _loc5_;
      _loc9_ = 30 * Math.sin(_loc2_);
      var _loc13_ = Math.atan2(_loc9_,_loc6_);
      _loc2_ = com.abowman.math.Trig.fixAngle(_loc13_ - _loc2_);
      if(_loc2_ > 3.141592653589793)
      {
         _loc2_ = -3.141592653589793 + _loc2_ % 3.141592653589793;
      }
      _loc2_ = Math.min(_loc2_,2.1);
      _loc2_ = Math.max(_loc2_,-2.1);
      _loc4_ = _loc2_;
      var _loc11_ = _loc3_.headAng;
      _loc4_ = _loc11_ + (_loc2_ - _loc11_) * 0.3;
      _loc3_.setHeadAng(_loc4_);
   }
   function getAngToPoint(pt)
   {
      var _loc2_ = com.abowman.math.Trig.angleTo(this._x,this._y,this._x + 30,pt.y);
      return _loc2_ + 6.283185307179586;
   }
   function drink()
   {
      this.nodHead();
      if(this.stopDrinkAt == undefined)
      {
         this.stopDrinkAt = this.frameNum + this.minDrink + (this.maxDrink - this.minDrink) * Math.random();
         this.drinkStartAt = this.frameNum;
         this.drinking = true;
      }
      if(this.stopDrinkAt < this.frameNum)
      {
         this.waterLevel = (this.frameNum - this.drinkStartAt) * 0.1;
         this.drinking = false;
         this.goingTo = Hamster.NOTHING;
         this.stopDrinkAt = undefined;
         trace("*****waterLevel" + this.waterLevel);
      }
   }
   function cleanFace(cosAng, sinAng)
   {
      if(this.stopCleanAt == undefined)
      {
         this.stopCleanAt = this.frameNum + this.minClean + (this.maxClean - this.minClean) * Math.random();
         if(this.ang > 2.356194490192345 && this.ang < 3.9269908169872414)
         {
            this.legFL.swapDepths(this.mcHiDepth2);
         }
         else if(this.ang < 0.7853981633974483 || this.ang > 5.497787143782138)
         {
            this.legFR.swapDepths(this.mcHiDepth2);
         }
         else if(this.ang > 0.7853981633974483 && this.ang < 2.356194490192345)
         {
            this.legFR.swapDepths(this.mcHiDepth1);
            this.legFL.swapDepths(this.mcHiDepth2);
         }
      }
      this.handZ = 2;
      this.lookHere.x = cosAng * 40 + this._x + this.mcHead._x;
      this.lookHere.y = 25 + this._y + this.mcHead._y;
      this.legCleanVel = 0.8;
      this.legCleanAng += this.legCleanVel;
      this.legAngF = 0.47123889803846897;
      this.legFR.moveOval(this.legCleanAng,cosAng,sinAng,2,2,0);
      this.legFL.moveOval(this.legCleanAng,cosAng,sinAng,2,2,0);
      this.nodHead();
      if(this.stopCleanAt < this.frameNum)
      {
         this.cleaning = false;
         this.stopCleanAt = undefined;
         this.legQuad = 0;
      }
   }
   function decideWhatToDo()
   {
      if(this.waterLevel <= 0)
      {
         if(this.goingTo != Hamster.WATER)
         {
            this.waterLevel = 0;
            this.goingTo = Hamster.WATER;
            this.dest = this.app.waterPos;
            this.lookHere.x = this.dest.x;
            this.lookHere.y = this.dest.y;
            if(this.isOnWheel)
            {
               this.isOnWheel = false;
               this.getOnWheel = true;
               this.isTired = false;
               this.restAt = undefined;
            }
         }
         return undefined;
      }
      if(this.app.freshFood.length > 0)
      {
         this.lookForFood();
      }
      var _loc6_;
      var _loc5_;
      if(this.goingTo == Hamster.FOOD)
      {
         if(this.sleepID != undefined)
         {
            _global.clearTimeout(this.sleepID);
            this.sleepID = undefined;
         }
         if(this.isOnWheel)
         {
            this.isOnWheel = false;
            this.isTired = false;
            this.restAt = undefined;
         }
         this.lookHere.x = this.food._x;
         this.lookHere.y = this.food._y;
         _loc6_ = this.food._x - (this.mcHead._x + this.mcMouthR._x + this._x);
         _loc5_ = this.food._y - (this.mcHead._y + this.mcMouthR._y + this._y);
         if(this.food.drag)
         {
            if(Math.abs(_loc6_) < 35 && Math.abs(_loc5_) < 25)
            {
               this.lookHere.y -= 15;
            }
         }
         if(Math.abs(_loc6_) < 5 && Math.abs(_loc5_) < 5)
         {
            if(this.food.drag || this.food._y + this.food.radius == this.groundY)
            {
               this.pickUpFood();
            }
         }
         this.sniffFood();
         return undefined;
      }
      if(this.app.mouseActive)
      {
         if(this.sleepID != undefined)
         {
            _global.clearTimeout(this.sleepID);
            this.sleepID = undefined;
         }
         if(!this.wheelClicked)
         {
            if(this.goingTo != Hamster.MOUSE)
            {
               this.dest = {};
               this.gotoRandomAt = undefined;
               this.goingTo = Hamster.MOUSE;
            }
            this.lookHere.x = this.dest.x = this.app.xmouse;
            this.lookHere.y = this.dest.y = this.app.ymouse;
            this.runAt = undefined;
            return undefined;
         }
      }
      else if(this.goingTo == Hamster.MOUSE)
      {
         this.dest = undefined;
         this.goingTo = Hamster.NOTHING;
      }
      var _loc3_;
      var _loc7_;
      var _loc4_;
      if(this.getOnWheel)
      {
         this.dest = {};
         _loc3_ = this.app.wheel._x;
         _loc7_ = this.app.wheel._y;
         _loc4_ = this.app.wheel._width / 2;
         if(this._x < _loc3_)
         {
            this.dest.x = _loc3_ + _loc4_ * 1.5;
            this.tarWheelAng = 0;
         }
         else
         {
            this.dest.x = _loc3_ - _loc4_ * 1.5;
            this.tarWheelAng = 3.141592653589793;
         }
         this.goingTo = Hamster.WHEEL;
         this.getOnWheel = false;
         this.dest.y = _loc7_ + _loc4_ * 0.5;
         this.lookHere.x = this.dest.x;
         this.lookHere.y = this.dest.y;
      }
      if(this.goingTo == Hamster.WHEEL)
      {
         if(this.dest.x - this.app.wheel._x > 0)
         {
            if(this._x - this.app.wheel._x > -10 && this.ang < 1.2566370614359172)
            {
               this.isOnWheel = true;
               this.goingTo = Hamster.NOTHING;
               this.legVel = 0.2;
               this.wheelClicked = false;
            }
         }
         else if(this._x - this.app.wheel._x < 10 && this.ang > 1.8849555921538759)
         {
            this.isOnWheel = true;
            this.goingTo = Hamster.NOTHING;
            this.legVel = 0.2;
            this.wheelClicked = false;
         }
         return undefined;
      }
      if(this.goingTo == Hamster.NOTHING)
      {
         if(this.sleepID == undefined)
         {
            this.sleepID = _global.setTimeout(this,"goToSleep",this.sleepInterval);
            trace("sleepID=" + this.sleepID);
         }
         if(!this.sleeping && !this.isOnWheel)
         {
            this.lookRandom();
            this.gotoRandom();
            if(Math.random() * 90 < 1)
            {
               this.cleaning = true;
            }
            if(this.runAt == undefined)
            {
               this.runAt = this.frameNum + this.minWait + (this.maxWait - this.minWait) * Math.random();
            }
            if(this.frameNum > this.runAt)
            {
               this.isTired = false;
               this.restAt = undefined;
               this.runAt = undefined;
               this.getOnWheel = true;
            }
         }
      }
      else
      {
         this.lookRandomAt = undefined;
      }
   }
   function runOnWheel(cos, sin)
   {
      var _loc7_ = this.ht;
      var _loc8_ = cos;
      var _loc3_ = this.app.wheel;
      var _loc6_ = this.app.wheelRadius - 3;
      var _loc4_ = com.abowman.math.Trig.angleTo(_loc3_._x,_loc3_._y,this._x,this._y);
      this._x = Math.cos(_loc4_) * (_loc6_ - _loc7_) + _loc3_._x;
      this._y = Math.sin(_loc4_) * (_loc6_ - _loc7_) + _loc3_._y;
      if(this.isTired)
      {
         this.legVel -= this.hamAcc;
      }
      else
      {
         this.legVel += this.hamAcc;
      }
      this.legVel = Math.max(0,this.legVel);
      this.legVel = Math.min(this.maxHamVel,this.legVel);
      var _loc2_ = _loc8_ * this.legVel * this.hamVelToForce;
      this.app.pushWheel(_loc2_,this._x);
      _loc2_ -= this.app.wheelVel;
      var _loc5_ = _loc4_ - 1.5707963267948966;
      this.vx = Math.cos(_loc5_) * _loc2_;
      this.vy = Math.sin(_loc5_) * _loc2_;
      this._y += this.vy;
      this._x += this.vx;
      this._rotation = _loc5_ * 180 / 3.141592653589793;
      this.run(cos,sin);
      if(this.legVel > 0)
      {
         this.angAcc = this.dir * this.maxAngAcc * this.legVel / this.maxHamVel;
         if(int(Math.random() * this.angChance) == this.angChance / 2)
         {
            this.dir *= -1;
         }
         this.ang += this.angAcc;
         if(this.tarWheelAng == 0)
         {
            if(this.ang < -0.2 || this.ang > 0.2)
            {
               this.ang += (- this.ang) * 0.2;
            }
         }
         else if(this.ang < 2.941592653589793 || this.ang > 3.3415926535897933)
         {
            this.ang += (3.141592653589793 - this.ang) * 0.2;
         }
         if(this.ang < 0.01 && this.ang > 0)
         {
            this.ang = 0;
         }
      }
   }
   function update()
   {
      this.frameNum = this.frameNum + 1;
      this.lookPt = this.lookHere;
      var _loc3_ = Math.cos(this.ang);
      var _loc5_ = Math.sin(this.ang);
      this.mouthPt.x = this.mcMouthR.opoints[2].cx + this.mcHead._x + this.mcMouthR._x + this._x;
      this.mouthPt.y = this.mcMouthR.opoints[2].cy + this.mcHead._y + this.mcMouthR._y + this._y;
      this.midHandPt.x = (this.legFR.ftPos.xpos + this.legFL.ftPos.xpos) / 2 + this._x;
      this.midHandPt.y = (this.legFR.ftPos.ypos + this.legFL.ftPos.ypos) / 2 + this._y;
      if(!this.sleeping && !this.eating && !this.drinking && !this.cleaning)
      {
         this.decideWhatToDo();
      }
      else if(this.sleeping && this.app.mouseActive)
      {
         this.wakeUp();
      }
      var _loc12_;
      if(this.isOnWheel)
      {
         this.lookHere.x = this._x + 50 * _loc3_;
         this.lookHere.y = this._y;
      }
      if(this.lookPt != undefined)
      {
         _loc12_ = this.getAngToPoint(this.lookPt);
      }
      this.legAngR = 1.5707963267948966;
      this.legAngF = 1.5707963267948966;
      this.handZ = 20;
      var _loc6_ = this.walkAng;
      var _loc15_;
      if(this.isOnWheel)
      {
         this.lookHere.x = this._x + 70 * _loc3_;
         this.lookHere.y = this._y - 20;
         if(this.isTired)
         {
            if(this.runAt == undefined)
            {
               this.runAt = this.frameNum + this.minRest + (this.maxRest - this.minRest) * Math.random();
               trace("runAt=" + this.runAt);
            }
            if(this.frameNum > this.runAt)
            {
               this.isTired = false;
               this.restAt = undefined;
            }
         }
         else
         {
            if(this.restAt == undefined)
            {
               this.restAt = this.frameNum + this.minRun + (this.maxRun - this.minRun) * Math.random();
               trace("restAt=" + this.restAt);
            }
            if(this.frameNum > this.restAt)
            {
               this.isTired = true;
               this.runAt = undefined;
               if(Math.random() * 3 < 1)
               {
                  this.getOffWheel = true;
               }
            }
         }
         if(this.getOffWheel && this.legVel < 0.3)
         {
            this.getOffWheel = false;
            this.isOnWheel = false;
            this.isTired = false;
            this.restAt = undefined;
            this.runAt = undefined;
            this.dest = {};
            if(this.ang > 1.5707963267948966)
            {
               this.dest.x = this.app.wheel._x - this.app.wheelRadius;
            }
            else
            {
               this.dest.x = this.app.wheel._x + this.app.wheelRadius;
            }
            this.dest.y = this.groundY - 20;
            this.lookHere.y = this.dest.y = this._y - Math.random() * 50;
            this.lookHere.x = this.dest.x;
            this.goingTo = Hamster.RANDOM;
            this.gotoRandomAt = undefined;
         }
         if(this.frameNum % 500 == 0)
         {
            trace("-2");
            this.waterLevel -= 2;
         }
         this.runOnWheel(_loc3_,_loc5_);
      }
      else
      {
         if(this.goingTo != Hamster.NOTHING)
         {
            if(this.goingTo == Hamster.WATER)
            {
               if(Math.abs(this.lookHere.x - this.mouthPt.x) < 20)
               {
                  this.lookHere.y = this.app.waterPos.y - 15;
                  this.drink();
               }
            }
            else if(_loc12_ < 5.3 && Math.abs(this.lookPt.x - this._x) < 60)
            {
               _loc6_ = _loc12_;
               this.legAngR = 1.2566370614359172;
               this.handZ = 8;
            }
         }
         else if(this.sleepAtDest)
         {
            _loc6_ = this.walkAng;
            this.legAngR = 0.47123889803846897;
            this.legAngF = 0.47123889803846897;
            this.handZ = 4;
            this.lookHere.x = this._x + 50 * _loc3_;
            this.lookHere.y = this._y + 10;
            _global.setTimeout(this,"sleep",1000 + Math.random() * 2000);
         }
         else
         {
            _loc6_ = this.eatStandAng;
            this.legAngR = 0.7853981633974483;
            this.handZ = 8;
         }
         if(this.eating)
         {
            this.lookHere.x = _loc3_ * 40 + this._x + this.mcHead._x;
            this.lookHere.y = 30 + this._y + this.mcHead._y;
            this.lookPt = this.lookHere;
            this.legAngF = 0.7853981633974483;
            this.legAngR = 0.7853981633974483;
            this.handZ = 4;
            _loc6_ = this.eatStandAng;
            this.eatFood();
         }
         else if(this.cleaning)
         {
            _loc6_ = this.eatStandAng;
            this.cleanFace(_loc3_,_loc5_);
         }
         this.vy += this.grav;
         this._y += this.vy;
         if(this._y + this.ht >= this.groundY)
         {
            this.vy = 0;
            this.vx = 0;
            this._y = this.groundY - this.ht;
         }
         if(this._rotation != 0)
         {
            this._rotation += (- this._rotation) * 0.5;
            if(Math.abs(this._rotation) <= 1)
            {
               this._rotation = 0;
            }
         }
         if(this.dest != undefined)
         {
            _loc15_ = this.walk(_loc3_,_loc5_);
            if(!_loc15_ && this.goingTo == Hamster.RANDOM)
            {
               this.goingTo = Hamster.NOTHING;
            }
         }
         else
         {
            this.legRR.update4({x:0,z:0},_loc3_,_loc5_);
            this.legRL.update4({x:0,z:0},_loc3_,_loc5_);
         }
         if(this.isStanding && !this.cleaning)
         {
            this.legFR.updateLeg(_loc3_,_loc5_,-1.5707963267948966);
            this.legFL.updateLeg(_loc3_,_loc5_,-1.5707963267948966);
         }
      }
      this.standTo2(_loc6_);
      if(this.lookPt != undefined)
      {
         this.look(this.lookPt);
      }
      this.mcLines.clear();
      this.mcLines.lineStyle(this.outlineWidth);
      this.headPos.xpos = this.mcBody._x + _loc3_ * this.headPos.x + _loc5_ * this.headPos.z;
      this.headPos.ypos = this.mcBody._y + this.headPos.y - this.headBounce;
      this.mcHead._x = this.headPos.xpos;
      this.mcHead._y = this.headPos.ypos;
      this.updateHead();
      this.legBaseFR.z += (- this.handZ - this.legBaseFR.z) * 0.3;
      this.legBaseFL.z += (this.handZ - this.legBaseFL.z) * 0.3;
      this.legRR.legAng += (this.legAngR - this.legRR.legAng) * 0.2;
      this.legRL.legAng += (this.legAngR - this.legRL.legAng) * 0.2;
      this.legFR.legAng += (this.legAngF - this.legFR.legAng) * 0.2;
      this.legFL.legAng += (this.legAngF - this.legFL.legAng) * 0.2;
      this.ht = this.legBaseRR.y + 2 + Math.sin(this.legRR.legAng) * this.legRR.legLen;
      this.updateLegs(_loc3_,_loc5_);
      var _loc4_ = com.abowman.math.Trig.fixAngle(this.headAng + this.ang);
      if(this.headAngZ > -0.3)
      {
         if(_loc4_ <= 2 && _loc4_ >= 1)
         {
            if(!this.ear1Top)
            {
               this.mcEar1.swapDepths(this.hiEarDepth1);
               this.ear1Top = true;
            }
            if(!this.ear2Top)
            {
               this.mcEar2.swapDepths(this.hiEarDepth2);
               this.ear2Top = true;
            }
         }
         else if(_loc4_ > 2 && _loc4_ < 4)
         {
            if(!this.ear1Top)
            {
               this.mcEar1.swapDepths(this.hiEarDepth1);
               this.ear1Top = true;
            }
            if(this.ear2Top)
            {
               this.mcEar2.swapDepths(this.lowEarDepth2);
               this.ear2Top = false;
            }
         }
         else if(_loc4_ < 1 || _loc4_ > 5.44)
         {
            if(this.ear1Top)
            {
               this.mcEar1.swapDepths(this.lowEarDepth1);
               this.ear1Top = false;
            }
            if(!this.ear2Top)
            {
               this.mcEar2.swapDepths(this.hiEarDepth2);
               this.ear2Top = true;
            }
         }
         else
         {
            if(this.ear1Top)
            {
               this.mcEar1.swapDepths(this.lowEarDepth1);
               this.ear1Top = false;
            }
            if(this.ear2Top)
            {
               this.mcEar2.swapDepths(this.lowEarDepth2);
               this.ear2Top = false;
            }
         }
      }
      else if(_loc4_ <= 1.75 && _loc4_ >= 1.35)
      {
         if(!this.ear1Top)
         {
            this.mcEar1.swapDepths(this.hiEarDepth1);
            this.ear1Top = true;
         }
         if(!this.ear2Top)
         {
            this.mcEar2.swapDepths(this.hiEarDepth2);
            this.ear2Top = true;
         }
      }
      else if(_loc4_ > 1.75 && _loc4_ < 4)
      {
         if(!this.ear1Top)
         {
            this.mcEar1.swapDepths(this.hiEarDepth1);
            this.ear1Top = true;
         }
         if(this.ear2Top)
         {
            this.mcEar2.swapDepths(this.lowEarDepth2);
            this.ear2Top = false;
         }
      }
      else if(_loc4_ < 1.35 || _loc4_ > 5.44)
      {
         if(this.ear1Top)
         {
            this.mcEar1.swapDepths(this.lowEarDepth1);
            this.ear1Top = false;
         }
         if(!this.ear2Top)
         {
            this.mcEar2.swapDepths(this.hiEarDepth2);
            this.ear2Top = true;
         }
      }
      else
      {
         if(this.ear1Top)
         {
            this.mcEar1.swapDepths(this.lowEarDepth1);
            this.ear1Top = false;
         }
         if(this.ear2Top)
         {
            this.mcEar2.swapDepths(this.lowEarDepth2);
            this.ear2Top = false;
         }
      }
      if(this.legQuad != 1 && (this.ang < 0.7853981633974483 || this.ang > 5.497787143782138))
      {
         this.legQuad = 1;
         this.legFR.swapDepths(this.legFR.depth + 10);
         this.legFL.swapDepths(this.legFL.depth);
         this.legRL.swapDepths(this.legRL.depth);
         this.legRR.swapDepths(this.legRR.depth + 10);
      }
      else if(this.legQuad != 2 && (this.ang > 0.7853981633974483 && this.ang < 2.356194490192345))
      {
         this.legQuad = 2;
         this.legFR.swapDepths(this.legFR.depth + 10);
         this.legFL.swapDepths(this.legFL.depth + 15);
         this.legRL.swapDepths(this.legRL.depth);
         this.legRR.swapDepths(this.legRR.depth + 5);
      }
      else if(this.legQuad != 3 && (this.ang > 2.356194490192345 && this.ang < 3.9269908169872414))
      {
         this.legQuad = 3;
         this.legFR.swapDepths(this.legFR.depth);
         this.legFL.swapDepths(this.legFL.depth + 10);
         this.legRL.swapDepths(this.legRL.depth + 10);
         this.legRR.swapDepths(this.legRR.depth);
      }
      else if(this.legQuad != 4 && (this.ang > 3.9269908169872414 && this.ang < 5.497787143782138))
      {
         this.legQuad = 4;
         this.legFR.swapDepths(this.legFR.depth);
         this.legFL.swapDepths(this.legFL.depth);
         this.legRL.swapDepths(this.legRL.depth + 10);
         this.legRR.swapDepths(this.legRR.depth + 10);
      }
      this.mcSegB.clear();
      this.mcSegB.beginFill(this.bodyColor);
      var _loc11_ = (this.rearBodyPt.xpos + this.frontBodyPt.xpos) * 0.5;
      var _loc10_ = (this.rearBodyPt.ypos + this.frontBodyPt.ypos) * 0.5;
      var _loc8_ = this.rearBodyPt.xpos - this.frontBodyPt.xpos;
      var _loc7_ = this.rearBodyPt.ypos - this.frontBodyPt.ypos;
      var _loc9_ = Math.sqrt(_loc8_ * _loc8_ + _loc7_ * _loc7_) / 2;
      var _loc13_ = Math.atan2(_loc7_,_loc8_);
      com.abowman.graphics.Draw.drawOval2(this.mcSegB,_loc11_,_loc10_,_loc9_ + this.radiusA,this.radiusB,_loc13_);
      this.mcSegB.endFill();
      this.mcBody.clear();
      this.mcBody.lineStyle(2);
      this.tailPos.xpos = this.mcBody._x + _loc3_ * this.tailPos.x + _loc5_ * this.tailPos.z;
      this.tailPos.ypos = this.mcBody._y + this.tailPos.y;
      this.mcTail.clear();
      this.mcTail.lineStyle(1);
      _loc8_ = this.rearBodyPt.xpos - this.tailPos.xpos;
      _loc7_ = this.rearBodyPt.ypos - this.tailPos.ypos;
      var _loc14_ = Math.atan2(_loc7_,_loc8_);
      this.drawTail(this.mcTail,this.tailPos.xpos,this.tailPos.ypos,4,7,_loc14_,this.tailColor);
      com.abowman.graphics.Draw.drawOval2(this.mcLines,_loc11_,_loc10_,_loc9_ + this.radiusA,this.radiusB,_loc13_);
      var _loc17_ = this.app.waterX;
      var _loc16_ = this.app.waterY;
      this.legFL.render2(this.mcLines);
      this.legFR.render2(this.mcLines);
      this.legRR.render2(this.mcLines);
      this.legRL.render2(this.mcLines);
   }
   function updateHead()
   {
      var _loc2_ = this.ang + this.headAng;
      this.mcBody.lineStyle(2);
      var _loc3_ = Math.cos(_loc2_);
      var _loc4_ = Math.sin(_loc2_);
      this.mcEye1._x = _loc3_ * this.eyePt.x + this.eyeGap * _loc4_;
      this.mcEye1._y = this.eyePt.y;
      this.mcEye2._x = _loc3_ * this.eyePt.x - this.eyeGap * _loc4_;
      this.mcEye2._y = this.eyePt.y;
      this.mcEye2.ang = _loc2_;
      this.mcEye2.update();
      this.mcEye1.ang = _loc2_;
      this.mcEye1.update();
      this.mcHeadZ.ang = _loc2_;
      this.mcHeadZ.update(this.mcLines,this.mcHead._x,this.mcHead._y);
      this.mcHeadX.ang = _loc2_;
      this.mcHeadX.update(this.mcLines,this.mcHead._x,this.mcHead._y);
      if(_loc3_ > 0 && this.topEye == 1)
      {
         this.mcEye1.swapDepths(this.mcEye2);
         this.mcMouthR.swapDepths(this.mcMouthL);
         this.mcFaceUpperR.swapDepths(this.mcFaceUpperL);
         this.topEye = 2;
      }
      else if(_loc3_ < 0 && this.topEye == 2)
      {
         this.mcEye1.swapDepths(this.mcEye2);
         this.mcMouthR.swapDepths(this.mcMouthL);
         this.mcFaceUpperR.swapDepths(this.mcFaceUpperL);
         this.topEye = 1;
      }
      if(this.headAngZ < -0.4 && !this.mouthOnTop)
      {
         if(this.topEye == 2)
         {
            this.mcHeadHiDepth1.swapDepths(this.mcMouthL);
            this.mcHeadHiDepth2.swapDepths(this.mcMouthR);
         }
         else
         {
            this.mcHeadHiDepth2.swapDepths(this.mcMouthL);
            this.mcHeadHiDepth1.swapDepths(this.mcMouthR);
         }
         this.mouthOnTop = true;
      }
      else if(this.headAngZ > -0.4 && this.mouthOnTop)
      {
         if(this.topEye == 2)
         {
            this.mcHeadHiDepth1.swapDepths(this.mcMouthL);
            this.mcHeadHiDepth2.swapDepths(this.mcMouthR);
         }
         else
         {
            this.mcHeadHiDepth2.swapDepths(this.mcMouthL);
            this.mcHeadHiDepth1.swapDepths(this.mcMouthR);
         }
         this.mouthOnTop = false;
      }
      this.mcMouthL._x = this.mcMouthR._x = _loc3_ * this.snoutPt.x;
      this.mcMouthL._y = this.mcMouthR._y = this.snoutPt.y;
      this.mcMouthL.ang = this.mcMouthR.ang = _loc2_;
      this.mcMouthR.update(this.mcLines,this.mcHead._x + this.mcMouthR._x,this.mcHead._y + this.mcMouthR._y);
      this.mcMouthL.update(this.mcLines,this.mcHead._x + this.mcMouthL._x,this.mcHead._y + this.mcMouthL._y);
      this.mcFaceUpperR._x = _loc3_ * this.snoutPt.x;
      this.mcFaceUpperR._y = this.snoutPt.y;
      this.mcFaceUpperR.ang = _loc2_;
      this.mcFaceUpperR.update(this.mcLines,this.mcHead._x + this.mcFaceUpperR._x,this.mcHead._y + this.mcFaceUpperR._y);
      this.mcFaceUpperL._x = _loc3_ * this.snoutPt.x;
      this.mcFaceUpperL._y = this.snoutPt.y;
      this.mcFaceUpperL.ang = _loc2_;
      this.mcFaceUpperL.update(this.mcLines,this.mcHead._x + this.mcFaceUpperL._x,this.mcHead._y + this.mcFaceUpperL._y);
      this.mcEar1.ang = _loc2_;
      this.mcEar1._x = _loc3_ * this.earPt.x + this.earGap * _loc4_ + this.mcHead._x;
      this.mcEar1._y = this.earPt.y + this.mcHead._y;
      this.mcEar1.update();
      this.mcEar2.ang = _loc2_;
      this.mcEar2._x = _loc3_ * this.earPt.x - this.earGap * _loc4_ + this.mcHead._x;
      this.mcEar2._y = this.earPt.y + this.mcHead._y;
      this.mcEar2.update();
      this.mcHeadCrown._x = this.neckLen * 0.5 * _loc3_;
      this.mcHeadCrown._y = this.neckLen * Math.sin(this.headAngZ);
      com.abowman.graphics.Draw.drawOval(this.mcLines,this.mcHead._x + this.mcHeadCrown._x,this.mcHead._y + this.mcHeadCrown._y,15,15);
      if(this.eyesClosed)
      {
         this.eyesCloseFrac -= 0.3;
         this.eyesCloseFrac = Math.max(0,this.eyesCloseFrac);
      }
      else if(!this.sleeping && this.eyesCloseFrac < 1)
      {
         this.eyesCloseFrac += 0.3;
      }
      var _loc6_;
      var _loc5_;
      var _loc8_;
      var _loc7_;
      if(this.eyesCloseFrac < 1)
      {
         if(this.eyesCloseFrac == 0)
         {
            this.mcEye1.clear();
            this.mcEye1.lineStyle(1,this.mcEye1.lineColor);
            this.mcEye1.moveTo(this.mcEye1.opoints[0].cx,this.mcEye1.opoints[0].cy);
            this.mcEye1.lineTo(this.mcEye1.opoints[2].cx,this.mcEye1.opoints[2].cy);
            this.mcEye2.clear();
            this.mcEye2.lineStyle(1,this.mcEye2.lineColor);
            this.mcEye2.moveTo(this.mcEye2.opoints[0].cx,this.mcEye2.opoints[0].cy);
            this.mcEye2.lineTo(this.mcEye2.opoints[2].cx,this.mcEye2.opoints[2].cy);
            this.eyesClosed = false;
         }
         else
         {
            _loc6_ = this.mcEye1.opoints[1].cx;
            _loc5_ = this.mcEye1.opoints[1].cy * this.eyesCloseFrac;
            _loc8_ = this.mcEye1.opoints[3].cx;
            _loc7_ = this.mcEye1.opoints[3].cy * this.eyesCloseFrac;
            this.mcEye1.clear();
            this.mcEye1.beginFill(this.mcEye1.fillColor);
            this.mcEye1.lineStyle(1,this.mcEye1.lineColor);
            this.mcEye1.moveTo(this.mcEye1.opoints[0].cx,this.mcEye1.opoints[0].cy);
            this.mcEye1.curveTo(_loc6_,_loc5_,this.mcEye1.opoints[2].cx,this.mcEye1.opoints[2].cy);
            this.mcEye1.curveTo(_loc8_,_loc7_,this.mcEye1.opoints[0].cx,this.mcEye1.opoints[0].cy);
            this.mcEye1.endFill();
            _loc6_ = this.mcEye2.opoints[1].cx;
            _loc5_ = this.mcEye2.opoints[1].cy * this.eyesCloseFrac;
            _loc8_ = this.mcEye2.opoints[3].cx;
            _loc7_ = this.mcEye2.opoints[3].cy * this.eyesCloseFrac;
            this.mcEye2.clear();
            this.mcEye2.beginFill(this.mcEye1.fillColor);
            this.mcEye2.lineStyle(1,this.mcEye2.lineColor);
            this.mcEye2.moveTo(this.mcEye2.opoints[0].cx,this.mcEye2.opoints[0].cy);
            this.mcEye2.curveTo(_loc6_,_loc5_,this.mcEye2.opoints[2].cx,this.mcEye2.opoints[2].cy);
            this.mcEye2.curveTo(_loc8_,_loc7_,this.mcEye2.opoints[0].cx,this.mcEye2.opoints[0].cy);
            this.mcEye2.endFill();
         }
      }
   }
   function standTo2(a, frac)
   {
      if(a == this.walkAng)
      {
         this.isStanding = false;
      }
      else
      {
         this.isStanding = true;
      }
      if(frac == undefined)
      {
         frac = 0.2;
      }
      var _loc3_ = this.standToAng + (a - this.standToAng) * frac;
      this.stand(_loc3_);
   }
   function easeInOutSin(t, b, c, d)
   {
      return (- c) / 2 * (Math.cos(3.141592653589793 * t / d) - 1) + b;
   }
   function stand(a)
   {
      if(this.standToAng == a)
      {
         return undefined;
      }
      var _loc8_ = Math.cos(a);
      var _loc7_ = a;
      a -= this.standToAng;
      this.standToAng = _loc7_;
      var _loc5_ = Math.cos(a);
      var _loc4_ = Math.sin(a);
      var _loc3_ = -33;
      var _loc2_ = 10;
      this.headPos.x -= this.headPos.ox + _loc3_;
      this.headPos.y -= this.headPos.oy + _loc2_;
      this.rotateZ(this.headPos,_loc5_,_loc4_);
      this.headPos.x += this.headPos.ox + _loc3_;
      this.headPos.y += this.headPos.oy + _loc2_;
      _loc3_ = -25;
      _loc2_ = 10;
      this.frontRightPt.x -= this.frontRightPt.ox + _loc3_;
      this.frontRightPt.y -= this.frontRightPt.oy + _loc2_;
      this.rotateZ(this.frontRightPt,_loc5_,_loc4_);
      this.frontRightPt.x += this.frontRightPt.ox + _loc3_;
      this.frontRightPt.y += this.frontRightPt.oy + _loc2_;
      this.frontLeftPt.x -= this.frontLeftPt.ox + _loc3_;
      this.frontLeftPt.y -= this.frontLeftPt.oy + _loc2_;
      this.rotateZ(this.frontLeftPt,_loc5_,_loc4_);
      this.frontLeftPt.x += this.frontLeftPt.ox + _loc3_;
      this.frontLeftPt.y += this.frontLeftPt.oy + _loc2_;
      _loc3_ = -20;
      _loc2_ = -13;
      this.legBaseFR.x -= this.legBaseFR.ox + _loc3_;
      this.legBaseFR.y -= this.legBaseFR.oy + _loc2_;
      this.rotateZ(this.legBaseFR,_loc5_,_loc4_);
      this.legBaseFR.x += this.legBaseFR.ox + _loc3_;
      this.legBaseFR.y += this.legBaseFR.oy + _loc2_;
      this.legBaseFL.x -= this.legBaseFR.ox + _loc3_;
      this.legBaseFL.y -= this.legBaseFR.oy + _loc2_;
      this.rotateZ(this.legBaseFL,_loc5_,_loc4_);
      this.legBaseFL.x += this.legBaseFR.ox + _loc3_;
      this.legBaseFL.y += this.legBaseFR.oy + _loc2_;
      _loc3_ = -20;
      _loc2_ = 6;
      this.frontInRightPt.x -= this.frontInRightPt.ox + _loc3_;
      this.frontInRightPt.y -= this.frontInRightPt.oy + _loc2_;
      this.rotateZ(this.frontInRightPt,_loc5_,_loc4_);
      this.frontInRightPt.x += this.frontInRightPt.ox + _loc3_;
      this.frontInRightPt.y += this.frontInRightPt.oy + _loc2_;
      this.frontInLeftPt.x -= this.frontInLeftPt.ox + _loc3_;
      this.frontInLeftPt.y -= this.frontInLeftPt.oy + _loc2_;
      this.rotateZ(this.frontInLeftPt,_loc5_,_loc4_);
      this.frontInLeftPt.x += this.frontInLeftPt.ox + _loc3_;
      this.frontInLeftPt.y += this.frontInLeftPt.oy + _loc2_;
      _loc3_ = -10;
      _loc2_ = -2;
      this.midChestPt.x -= this.midChestPt.ox + _loc3_;
      this.midChestPt.y -= this.midChestPt.oy + _loc2_;
      this.rotateZ(this.midChestPt,_loc5_,_loc4_);
      this.midChestPt.x += this.midChestPt.ox + _loc3_;
      this.midChestPt.y += this.midChestPt.oy + _loc2_;
      _loc3_ = -2;
      _loc2_ = 5;
      this.legInnerR.x -= this.legInnerR.ox + _loc3_;
      this.legInnerR.y -= this.legInnerR.oy + _loc2_;
      this.rotateZ(this.legInnerR,_loc5_,_loc4_);
      this.legInnerR.x += this.legInnerR.ox + _loc3_;
      this.legInnerR.y += this.legInnerR.oy + _loc2_;
      _loc3_ = 10;
      _loc2_ = 8;
      this.rearPt.x -= this.rearPt.ox + _loc3_;
      this.rearPt.y -= this.rearPt.oy + _loc2_;
      this.rotateZ(this.rearPt,_loc5_,_loc4_);
      this.rearPt.x += this.rearPt.ox + _loc3_;
      this.rearPt.y += this.rearPt.oy + _loc2_;
      _loc3_ = -25;
      _loc2_ = 12;
      this.frontBodyPt.x -= this.frontBodyPt.ox + _loc3_;
      this.frontBodyPt.y -= this.frontBodyPt.oy + _loc2_;
      this.rotateZ(this.frontBodyPt,_loc5_,_loc4_);
      this.frontBodyPt.x += this.frontBodyPt.ox + _loc3_;
      this.frontBodyPt.y += this.frontBodyPt.oy + _loc2_;
      _loc3_ = -1;
      _loc2_ = 4;
      this.rearBodyPt.x -= this.rearBodyPt.ox + _loc3_;
      this.rearBodyPt.y -= this.rearBodyPt.oy + _loc2_;
      this.rotateZ(this.rearBodyPt,_loc5_,_loc4_);
      this.rearBodyPt.x += this.rearBodyPt.ox + _loc3_;
      this.rearBodyPt.y += this.rearBodyPt.oy + _loc2_;
      _loc3_ = 10;
      _loc2_ = 3;
      this.tailPos.x -= this.tailPos.ox + _loc3_;
      this.tailPos.y -= this.tailPos.oy + _loc2_;
      this.rotateZ(this.tailPos,_loc5_,_loc4_);
      this.tailPos.x += this.tailPos.ox + _loc3_;
      this.tailPos.y += this.tailPos.oy + _loc2_;
   }
   function updateLegs(cos, sin)
   {
      this.frontBodyPt.xpos = this.mcBody._x + cos * this.frontBodyPt.x + sin * this.frontBodyPt.z;
      this.frontBodyPt.ypos = this.mcBody._y + this.frontBodyPt.y - this.frontBounce;
      this.rearBodyPt.xpos = this.mcBody._x + cos * this.rearBodyPt.x + sin * this.rearBodyPt.z;
      this.rearBodyPt.ypos = this.mcBody._y + this.rearBodyPt.y - this.rearBounce;
      this.frontInRightPt.xpos = this.mcBody._x + cos * this.frontInRightPt.x + sin * this.frontInRightPt.z;
      this.frontInRightPt.ypos = this.mcBody._y + this.frontInRightPt.y;
      this.frontInLeftPt.xpos = this.mcBody._x + cos * this.frontInLeftPt.x + sin * this.frontInLeftPt.z;
      this.frontInLeftPt.ypos = this.mcBody._y + this.frontInLeftPt.y;
      this.frontRightPt.xpos = this.mcBody._x + cos * this.frontRightPt.x + sin * this.frontRightPt.z;
      this.frontRightPt.ypos = this.mcBody._y + this.frontRightPt.y;
      this.frontLeftPt.xpos = this.mcBody._x + cos * this.frontLeftPt.x + sin * this.frontLeftPt.z;
      this.frontLeftPt.ypos = this.mcBody._y + this.frontLeftPt.y;
      this.rearRightPt.xpos = this.mcBody._x + cos * this.rearRightPt.x + sin * this.rearRightPt.z;
      this.rearRightPt.ypos = this.mcBody._y + this.rearRightPt.y;
      this.rearLeftPt.xpos = this.mcBody._x + cos * this.rearLeftPt.x + sin * this.rearLeftPt.z;
      this.rearLeftPt.ypos = this.mcBody._y + this.rearLeftPt.y;
      this.rearPt.xpos = this.mcBody._x + cos * this.rearPt.x + sin * this.rearPt.z;
      this.rearPt.ypos = this.mcBody._y + this.rearPt.y;
      this.legInnerR.xpos = this.mcBody._x + cos * this.legInnerR.x + sin * this.legInnerR.z;
      this.legInnerR.ypos = this.mcBody._y + this.legInnerR.y;
      this.midChestPt.xpos = this.mcBody._x + cos * this.midChestPt.x + sin * this.midChestPt.z;
      this.midChestPt.ypos = this.mcBody._y + this.midChestPt.y;
      this.legBaseFR.xpos = this.mcBody._x + cos * this.legBaseFR.x + sin * this.legBaseFR.z;
      this.legBaseFR.ypos = this.mcBody._y + this.legBaseFR.y;
      this.legBaseFL.xpos = this.mcBody._x + cos * this.legBaseFL.x + sin * this.legBaseFL.z;
      this.legBaseFL.ypos = this.mcBody._y + this.legBaseFL.y;
      this.legBaseRR.xpos = this.mcBody._x + cos * this.legBaseRR.x + sin * this.legBaseRR.z;
      this.legBaseRR.ypos = this.mcBody._y + this.legBaseRR.y;
      this.legBaseRL.xpos = this.mcBody._x + cos * this.legBaseRL.x + sin * this.legBaseRL.z;
      this.legBaseRL.ypos = this.mcBody._y + this.legBaseRL.y;
   }
   function tiltHead(a)
   {
      this.tiltEars(a);
      this.mcHeadX.rotateZ(a,true);
      this.mcHeadZ.rotateZ(a,true);
      this.mcMouthL.rotateZ(a,true);
      this.mcMouthR.rotateZ(a,true);
      this.mcFaceUpperR.rotateZ(a,true);
      this.mcFaceUpperL.rotateZ(a,true);
      if(a == this.headAngZ)
      {
         return undefined;
      }
      var _loc5_;
      if(this.headAngZ != a)
      {
         _loc5_ = a;
         a -= this.headAngZ;
         this.headAngZ = _loc5_;
      }
      var _loc4_ = Math.cos(a);
      var _loc3_ = Math.sin(a);
      this.rotateZ(this.eyePt,_loc4_,_loc3_);
      this.rotateZ(this.earPt,_loc4_,_loc3_);
      this.rotateZ(this.snoutPt,_loc4_,_loc3_);
   }
   function rotateZ(op, cosAng, sinAng)
   {
      var _loc3_ = op.x;
      var _loc2_ = op.y;
      op.x = cosAng * _loc3_ - sinAng * _loc2_;
      op.y = cosAng * _loc2_ + sinAng * _loc3_;
   }
   function tiltEars(ang)
   {
      this.mcEar1.rotateZ(ang,true);
      this.mcEar2.rotateZ(ang,true);
      this.mcEye1.rotateZ(ang,true);
      this.mcEye2.rotateZ(ang,true);
   }
   function createBodyXY(mc, depth, fillColor)
   {
      var _loc3_ = new Array();
      _loc3_.push({x:38,y:-5,z:0});
      _loc3_.push({x:34,y:5,z:0});
      _loc3_.push({x:25,y:13,z:0});
      _loc3_.push({x:12,y:14,z:0});
      _loc3_.push({x:-4,y:14,z:0});
      _loc3_.push({x:-23,y:14,z:0});
      _loc3_.push({x:-35,y:11,z:0});
      _loc3_.push({x:-44,y:3,z:0,curve:true});
      _loc3_.push({x:-38,y:-12,z:0});
      _loc3_.push({x:-26,y:-27,z:0,curve:true});
      _loc3_.push({x:-5,y:-26,z:0});
      _loc3_.push({x:14,y:-26,z:0,curve:true});
      _loc3_.push({x:29,y:-17,z:0});
      return HamsterPart.create(mc,depth,{points:_loc3_,fillColor:fillColor});
   }
   function run(cos, sin)
   {
      var _loc2_ = this.legVel / this.maxLegVel;
      var _loc7_ = this.maxStepDist * 0.2 + this.maxStepDist * 0.8 * _loc2_;
      var _loc6_ = this.maxStepDist * 0.4 + this.maxStepDist * 0.8 * _loc2_;
      this.stepHt = _loc2_ * this.maxStepHt;
      var _loc8_ = -8;
      var _loc9_ = -15;
      this.legBaseRL.x = this.legBaseRR.x = _loc9_ + _loc2_ * _loc8_;
      this.angVel += this.legVel;
      if(this.legVel > 0.7)
      {
      }
      var _loc3_;
      if(this.isOnWheel)
      {
         _loc3_ = this.wheelAng;
      }
      var _loc10_ = this.legVel / this.maxLegVel;
      this.legFR.update(this.angVel,cos,sin,_loc7_,this.stepHt,- _loc3_);
      this.legFL.update(this.angVel,cos,sin,_loc7_,this.stepHt,- _loc3_);
      this.legRR.update(this.angVel,cos,sin,_loc6_,this.stepHt,_loc3_);
      this.legRL.update(this.angVel,cos,sin,_loc6_,this.stepHt,_loc3_);
   }
   function walk(cosAng, sinAng)
   {
      var _loc7_;
      var _loc10_ = 2;
      var _loc13_ = 15;
      if(this.goingTo == Hamster.FOOD || this.goingTo == Hamster.MOUSE)
      {
         this.stepTime = 6;
         this.walkWait = 3;
      }
      else
      {
         this.stepTime = 6;
         this.walkWait = 3;
      }
      var _loc11_;
      if(this.goingTo == Hamster.FOOD || this.goingTo == Hamster.WATER)
      {
         _loc11_ = this.mouthPt.x;
         _loc13_ = 5;
      }
      else if(this.isStanding)
      {
         _loc11_ = cosAng * 40 + this._x;
      }
      else
      {
         _loc11_ = cosAng * 50 + this._x;
      }
      _loc7_ = this.dest.x - _loc11_;
      var _loc21_;
      var _loc20_;
      var _loc18_;
      var _loc19_;
      var _loc14_;
      var _loc12_;
      var _loc15_;
      var _loc16_;
      var _loc4_;
      var _loc9_;
      var _loc2_;
      if(this.frameNum % this.walkWait == 0)
      {
         _loc21_ = this.dest.x;
         _loc20_ = this.dest.y;
         this.legNum = this.legNum + 1;
         if(this.legNum == this.numLegs)
         {
            this.legNum = 0;
         }
         _loc18_ = this.legs[this.legNum];
         _loc14_ = 0;
         _loc12_ = 0;
         _loc15_ = this.dest.x - this._x;
         if(_loc15_ < 0)
         {
            _loc12_ = 3.141592653589793;
         }
         if(Math.abs(_loc15_) < 50)
         {
            _loc12_ = com.abowman.math.Trig.angleTo(this._x,this.ht,this.dest.x,this.ht + 40);
         }
         _loc16_ = _loc12_ - this.ang;
         _loc4_ = 1.5707963267948966;
         _loc9_ = Math.max(Math.min(_loc16_ * 0.5,_loc4_),- _loc4_);
         _loc2_ = 30;
         if(Math.abs(_loc7_) < 40)
         {
            _loc2_ *= 0.5;
         }
         else if(Math.abs(_loc7_) < 80)
         {
            _loc2_ *= 0.7;
         }
         else if(Math.abs(_loc7_) < 120)
         {
            _loc2_ *= 0.9;
         }
         if(Math.abs(_loc16_) < 0.8)
         {
            if(this.ang > 1.8849555921538759 || this.ang < 1.2566370614359172)
            {
               _loc2_ = Math.min(_loc2_,Math.max(_loc7_ * 0.3,- _loc2_));
               if(this.ang > 1.5707963267948966)
               {
                  _loc2_ *= -1;
               }
            }
         }
         else if(Math.abs(_loc7_) < 120)
         {
            _loc9_ = Math.max(Math.min(_loc16_ * 0.25,_loc4_),- _loc4_);
         }
         if(Math.abs(_loc7_) < _loc13_ || this.eating)
         {
            _loc10_ = 1;
            _loc2_ = 0;
            this.num0Strides = this.num0Strides + 1;
         }
         else
         {
            this.num0Strides = 0;
         }
         if(this.num0Strides > 4)
         {
            return false;
         }
         if(this.isStanding)
         {
            _loc2_ = Math.max(Math.min(10,_loc2_),-10);
            _loc10_ = 1;
         }
         else if(this.legNum == 0 || this.legNum == 2)
         {
            _loc4_ = 0.9424777960769379;
            _loc9_ = Math.max(Math.min(_loc9_,_loc4_),- _loc4_);
         }
         _loc14_ -= _loc9_;
         if(Math.abs(_loc9_) > 0.6283185307179586)
         {
            _loc2_ *= 0.5;
         }
         _loc19_ = this.getPos(_loc2_,_loc14_);
         _loc18_.stepTo(_loc19_,this.stepTime,_loc10_);
      }
      var _loc5_ = {x:(this.legFR.ftPos.x + this.legFL.ftPos.x + this.legRR.ftPos.x + this.legRL.ftPos.x) / 4,z:(this.legFR.ftPos.z + this.legFL.ftPos.z + this.legRR.ftPos.z + this.legRL.ftPos.z) / 4};
      var _loc8_ = {x:(this.legRR.ftPos.x + this.legRL.ftPos.x) / 2,z:(this.legRR.ftPos.z + this.legRL.ftPos.z) / 2};
      var _loc17_;
      if(!this.isStanding)
      {
         this.legFR.update4(_loc5_,cosAng,sinAng);
         this.legFL.update4(_loc5_,cosAng,sinAng);
         this.legRR.update4(_loc5_,cosAng,sinAng);
         this.legRL.update4(_loc5_,cosAng,sinAng);
         this._x += cosAng * _loc5_.x + sinAng * _loc5_.z;
         _loc17_ = 40;
         _loc16_ = Math.atan2(_loc5_.z * 1,_loc17_);
         this.ang -= _loc16_;
         this.ang = Math.min(3.1101767270538954,Math.max(this.ang,0));
      }
      else
      {
         _loc8_ = {x:(this.legRR.ftPos.x + this.legRL.ftPos.x) / 2,z:(this.legRR.ftPos.z + this.legRL.ftPos.z) / 2};
         this._x += cosAng * _loc8_.x + sinAng * _loc8_.z;
         _loc17_ = 40;
         _loc16_ = Math.atan2(_loc8_.z * 1,_loc17_);
         this.ang -= _loc16_;
         this.ang = Math.min(3.1101767270538954,Math.max(this.ang,0));
         this.legRR.update4(_loc8_,cosAng,sinAng);
         this.legRL.update4(_loc8_,cosAng,sinAng);
      }
      this.rearBounce = (this.legRR.currStepHt + this.legRL.currStepHt) / 2;
      this.frontBounce = (this.legFR.currStepHt + this.legFL.currStepHt) / 2;
      this.headBounce = (this.legFR.currStepHt + this.legFL.currStepHt) / 4;
      return true;
   }
   function getPos(stride, ang)
   {
      var _loc1_ = {x:0,z:0};
      _loc1_.x = Math.cos(ang) * stride;
      _loc1_.z = Math.sin(ang) * stride;
      return _loc1_;
   }
}
