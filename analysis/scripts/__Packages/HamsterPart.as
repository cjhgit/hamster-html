class HamsterPart extends MovieClip
{
   var closeShape;
   var opoints;
   static var symbolName = "__Packages.HamsterPart";
   static var symbolLinked = Object.registerClass(HamsterPart.symbolName,HamsterPart);
   var ang = 0;
   var angZ = 0;
   var angY = 0;
   var angX = 0;
   var fillColor = 15658734;
   var lineColor = 0;
   var lineWidth = 1;
   var scaX = 1;
   var scaY = 1;
   var scaZ = 1;
   function HamsterPart()
   {
      super();
   }
   static function create(parentMC, depth, args)
   {
      var _loc1_ = parentMC.attachMovie(HamsterPart.symbolName,"HamsterPart" + depth,depth);
      _loc1_.init(args);
      return _loc1_;
   }
   function init(args)
   {
      if(args.lineColor != undefined)
      {
         this.lineColor = args.lineColor;
      }
      if(args.fillColor != undefined)
      {
         this.fillColor = args.fillColor;
      }
      this.opoints = args.points;
      if(args.closeShape != undefined)
      {
         this.closeShape = args.closeShape;
      }
      trace(this._name);
   }
   function rotateZ(ang, absAng)
   {
      var _loc10_;
      if(absAng != undefined)
      {
         if(ang == this.angZ)
         {
            return undefined;
         }
         if(this.angZ != ang)
         {
            _loc10_ = ang;
            ang -= this.angZ;
            this.angZ = _loc10_;
         }
      }
      var _loc8_ = this.opoints.length;
      var _loc2_;
      var _loc7_ = Math.cos(ang);
      var _loc6_ = Math.sin(ang);
      var _loc5_;
      var _loc4_;
      var _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc5_ = _loc2_.x;
         _loc4_ = _loc2_.y;
         _loc2_.x = _loc7_ * _loc5_ - _loc6_ * _loc4_;
         _loc2_.y = _loc7_ * _loc4_ + _loc6_ * _loc5_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function rotateY(ang, absAng)
   {
      var _loc10_;
      if(absAng != undefined)
      {
         if(ang == this.angY)
         {
            return undefined;
         }
         if(this.angY != ang)
         {
            _loc10_ = ang;
            ang -= this.angY;
            this.angY = _loc10_;
         }
      }
      var _loc8_ = this.opoints.length;
      var _loc2_;
      var _loc7_ = Math.cos(ang);
      var _loc6_ = Math.sin(ang);
      var _loc5_;
      var _loc4_;
      var _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc5_ = _loc2_.x;
         _loc4_ = _loc2_.z;
         _loc2_.x = _loc7_ * _loc5_ - _loc6_ * _loc4_;
         _loc2_.z = _loc7_ * _loc4_ + _loc6_ * _loc5_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function rotateX(ang, absAng)
   {
      var _loc10_;
      if(absAng != undefined)
      {
         if(ang == this.angX)
         {
            return undefined;
         }
         if(this.angX != ang)
         {
            _loc10_ = ang;
            ang -= this.angX;
            this.angX = _loc10_;
         }
      }
      var _loc8_ = this.opoints.length;
      var _loc2_;
      var _loc7_ = Math.cos(ang);
      var _loc6_ = Math.sin(ang);
      var _loc5_;
      var _loc4_;
      var _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc5_ = _loc2_.y;
         _loc4_ = _loc2_.z;
         _loc2_.y = _loc7_ * _loc5_ + _loc6_ * _loc4_;
         _loc2_.z = _loc7_ * _loc4_ - _loc6_ * _loc5_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function update(mc, ox, oy)
   {
      var _loc10_ = Math.cos(this.ang);
      var _loc9_ = Math.sin(this.ang);
      var _loc8_ = this.opoints.length;
      var _loc2_;
      var _loc3_;
      this.clear();
      if(mc == undefined)
      {
         this.lineStyle(this.lineWidth,this.lineColor);
      }
      this.beginFill(this.fillColor);
      _loc2_ = this.opoints[0];
      if(_loc2_.curve)
      {
         _loc2_ = this.opoints[_loc8_ - 1];
      }
      _loc2_.cx = _loc2_.x * _loc10_;
      _loc2_.cy = _loc2_.y;
      if(_loc2_.z != undefined)
      {
         _loc2_.cx += _loc2_.z * _loc9_;
      }
      this.moveTo(_loc2_.cx,_loc2_.cy);
      if(mc != undefined)
      {
         mc.moveTo(ox + _loc2_.cx,oy + _loc2_.cy);
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc8_)
      {
         _loc2_ = this.opoints[_loc4_];
         if(_loc2_.lineColor != undefined)
         {
            this.lineColor = _loc2_.lineColor;
            this.lineStyle(1,this.lineColor);
         }
         _loc2_.cx = _loc2_.x * _loc10_;
         _loc2_.cy = _loc2_.y;
         if(_loc2_.z != undefined)
         {
            _loc2_.cx += _loc2_.z * _loc9_;
         }
         if(_loc2_.curve)
         {
            _loc4_ = _loc4_ + 1;
            if(_loc4_ == _loc8_)
            {
               _loc3_ = this.opoints[0];
            }
            else
            {
               _loc3_ = this.opoints[_loc4_];
            }
            _loc3_.cx = _loc3_.x * _loc10_;
            _loc3_.cy = _loc3_.y;
            if(_loc3_.z != undefined)
            {
               _loc3_.cx += _loc3_.z * _loc9_;
            }
            this.curveTo(_loc2_.cx,_loc2_.cy,_loc3_.cx,_loc3_.cy);
            if(mc != undefined)
            {
               mc.curveTo(ox + _loc2_.cx,oy + _loc2_.cy,ox + _loc3_.cx,oy + _loc3_.cy);
            }
         }
         else
         {
            this.lineTo(_loc2_.cx,_loc2_.cy);
            if(mc != undefined)
            {
               mc.lineTo(ox + _loc2_.cx,oy + _loc2_.cy);
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      this.lineStyle(1,this.fillColor);
      this.endFill(15658734);
   }
   function trans(vec)
   {
      var _loc5_ = this.opoints.length;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc2_.x += vec.x;
         _loc2_.y += vec.y;
         if(_loc2_.z != undefined)
         {
            _loc2_.z += vec.z;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function scale(v)
   {
      var _loc5_ = this.opoints.length;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc2_.x *= v;
         _loc2_.y *= v;
         if(_loc2_.z != undefined)
         {
            _loc2_.z *= v;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function scale3(v)
   {
      if(v.x == this.scaX && v.y == this.scaY && v.z == this.scaZ)
      {
         return undefined;
      }
      var _loc8_ = v.x - this.scaX;
      var _loc7_ = v.y - this.scaY;
      var _loc6_ = v.z - this.scaZ;
      this.scaX = v.x;
      this.scaY = v.y;
      this.scaZ = v.z;
      var _loc5_ = this.opoints.length;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc2_.x += _loc2_.x * _loc8_;
         _loc2_.y += _loc2_.y * _loc7_;
         if(_loc2_.z != undefined)
         {
            _loc2_.z += _loc2_.z * _loc6_;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function scale2(vec)
   {
      var _loc5_ = this.opoints.length;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.opoints[_loc3_];
         _loc2_.x *= vec.x;
         _loc2_.y *= vec.y;
         if(_loc2_.z != undefined)
         {
            _loc2_.z *= vec.z;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function toString()
   {
      var _loc4_ = this.opoints.length;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this.opoints[_loc3_];
         trace("points.push({x:" + _loc2_.x + ",y:" + _loc2_.y + ",z:" + _loc2_.z + ",curve:" + _loc2_.curve + "});");
         _loc3_ = _loc3_ + 1;
      }
   }
}
