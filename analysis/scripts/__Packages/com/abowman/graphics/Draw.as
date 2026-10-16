class com.abowman.graphics.Draw
{
   function Draw()
   {
   }
   static function drawOval(mc, x, y, rx, ry)
   {
      mc.moveTo(rx + x,y);
      mc.curveTo(rx + x,0.4142 * ry + y,0.7071 * rx + x,0.7071 * ry + y);
      mc.curveTo(0.4142 * rx + x,ry + y,x,ry + y);
      mc.curveTo(-0.4142 * rx + x,ry + y,-0.7071 * rx + x,0.7071 * ry + y);
      mc.curveTo(- rx + x,0.4142 * ry + y,- rx + x,y);
      mc.curveTo(- rx + x,-0.4142 * ry + y,-0.7071 * rx + x,-0.7071 * ry + y);
      mc.curveTo(-0.4142 * rx + x,- ry + y,x,- ry + y);
      mc.curveTo(0.4142 * rx + x,- ry + y,0.7071 * rx + x,-0.7071 * ry + y);
      mc.curveTo(rx + x,-0.4142 * ry + y,rx + x,y);
   }
   static function drawRoundRect(mc, x, y, w, h, cornerRadius)
   {
      if(arguments.length < 4)
      {
         return undefined;
      }
      var _loc3_;
      var _loc4_;
      var _loc9_;
      var _loc8_;
      var _loc11_;
      var _loc10_;
      if(cornerRadius > 0)
      {
         if(cornerRadius > Math.min(w,h) / 2)
         {
            cornerRadius = Math.min(w,h) / 2;
         }
         _loc3_ = 0.7853981633974483;
         mc.moveTo(x + cornerRadius,y);
         mc.lineTo(x + w - cornerRadius,y);
         _loc4_ = -1.5707963267948966;
         _loc9_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         _loc4_ += _loc3_;
         _loc9_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         mc.lineTo(x + w,y + h - cornerRadius);
         _loc4_ += _loc3_;
         _loc9_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         _loc4_ += _loc3_;
         _loc9_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + w - cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         mc.lineTo(x + cornerRadius,y + h);
         _loc4_ += _loc3_;
         _loc9_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         _loc4_ += _loc3_;
         _loc9_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + h - cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         mc.lineTo(x,y + cornerRadius);
         _loc4_ += _loc3_;
         _loc9_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
         _loc4_ += _loc3_;
         _loc9_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc8_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_ / 2) * cornerRadius / Math.cos(_loc3_ / 2);
         _loc11_ = x + cornerRadius + Math.cos(_loc4_ + _loc3_) * cornerRadius;
         _loc10_ = y + cornerRadius + Math.sin(_loc4_ + _loc3_) * cornerRadius;
         mc.curveTo(_loc9_,_loc8_,_loc11_,_loc10_);
      }
      else
      {
         mc.moveTo(x,y);
         mc.lineTo(x + w,y);
         mc.lineTo(x + w,y + h);
         mc.lineTo(x,y + h);
         mc.lineTo(x,y);
      }
   }
   static function drawOval2(mc, x, y, rx, ry, ang)
   {
      var _loc17_ = rx;
      var _loc20_ = 0.7071 * rx;
      var _loc18_ = 0.4142 * rx;
      var _loc16_ = ry;
      var _loc19_ = 0.7071 * ry;
      var _loc22_ = 0.4142 * ry;
      var _loc14_ = {x:_loc17_,y:_loc22_};
      var _loc13_ = {x:_loc20_,y:_loc19_};
      var _loc12_ = {x:_loc18_,y:_loc16_};
      var _loc11_ = {x:0,y:_loc16_};
      var _loc7_ = {x:- _loc17_,y:0};
      var _loc10_ = {x:- _loc17_,y:_loc22_};
      var _loc9_ = {x:- _loc20_,y:_loc19_};
      var _loc8_ = {x:- _loc18_,y:_loc16_};
      var _loc6_;
      var _loc5_;
      var _loc2_;
      var _loc1_;
      if(ang != 0 && ang != undefined)
      {
         _loc6_ = Math.cos(ang);
         _loc5_ = Math.sin(ang);
         _loc2_ = _loc14_.x;
         _loc1_ = _loc14_.y;
         _loc14_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc14_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc13_.x;
         _loc1_ = _loc13_.y;
         _loc13_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc13_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc12_.x;
         _loc1_ = _loc12_.y;
         _loc12_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc12_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc11_.x;
         _loc1_ = _loc11_.y;
         _loc11_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc11_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc7_.x;
         _loc1_ = _loc7_.y;
         _loc7_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc7_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc10_.x;
         _loc1_ = _loc10_.y;
         _loc10_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc10_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc9_.x;
         _loc1_ = _loc9_.y;
         _loc9_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc9_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
         _loc2_ = _loc8_.x;
         _loc1_ = _loc8_.y;
         _loc8_.x = _loc6_ * _loc2_ - _loc5_ * _loc1_;
         _loc8_.y = _loc6_ * _loc1_ + _loc5_ * _loc2_;
      }
      mc.moveTo(- _loc7_.x + x,- _loc7_.y + y);
      mc.curveTo(_loc14_.x + x,_loc14_.y + y,_loc13_.x + x,_loc13_.y + y);
      mc.curveTo(_loc12_.x + x,_loc12_.y + y,_loc11_.x + x,_loc11_.y + y);
      mc.curveTo(_loc8_.x + x,_loc8_.y + y,_loc9_.x + x,_loc9_.y + y);
      mc.curveTo(_loc10_.x + x,_loc10_.y + y,_loc7_.x + x,_loc7_.y + y);
      mc.curveTo(- _loc14_.x + x,- _loc14_.y + y,- _loc13_.x + x,- _loc13_.y + y);
      mc.curveTo(- _loc12_.x + x,- _loc12_.y + y,- _loc11_.x + x,- _loc11_.y + y);
      mc.curveTo(- _loc8_.x + x,- _loc8_.y + y,- _loc9_.x + x,- _loc9_.y + y);
      mc.curveTo(- _loc10_.x + x,- _loc10_.y + y,- _loc7_.x + x,- _loc7_.y + y);
   }
   static function drawSquare2(mc, x, y, rx, ry, ang)
   {
      var _loc12_ = rx;
      var _loc11_ = ry;
      var _loc1_ = {x:_loc12_,y:0};
      var _loc2_ = {x:0,y:_loc11_};
      var _loc8_;
      var _loc7_;
      var _loc4_;
      var _loc3_;
      if(ang != 0 && ang != undefined)
      {
         _loc8_ = Math.cos(ang);
         _loc7_ = Math.sin(ang);
         _loc4_ = _loc1_.x;
         _loc3_ = _loc1_.y;
         _loc1_.x = _loc8_ * _loc4_ - _loc7_ * _loc3_;
         _loc1_.y = _loc8_ * _loc3_ + _loc7_ * _loc4_;
         _loc4_ = _loc2_.x;
         _loc3_ = _loc2_.y;
         _loc2_.x = _loc8_ * _loc4_ - _loc7_ * _loc3_;
         _loc2_.y = _loc8_ * _loc3_ + _loc7_ * _loc4_;
      }
      mc.moveTo(_loc1_.x + x,_loc1_.y + y);
      mc.lineTo(_loc2_.x + x,_loc2_.y + y);
      mc.lineTo(- _loc1_.x + x,- _loc1_.y + y);
      mc.lineTo(- _loc2_.x + x,- _loc2_.y + y);
      mc.lineTo(_loc1_.x + x,_loc1_.y + y);
   }
   static function drawRect(mc, x1, y1, width, height)
   {
      mc.moveTo(x1,y1);
      mc.lineTo(x1 + width,y1);
      mc.lineTo(x1 + width,y1 + height);
      mc.lineTo(x1,y1 + height);
      mc.lineTo(x1,y1);
   }
   static function drawWedge(mc, x, y, startAngle, arc, radius, yRadius)
   {
      if(arguments.length < 5)
      {
         return undefined;
      }
      mc.moveTo(x,y);
      if(yRadius == undefined)
      {
         yRadius = radius;
      }
      var _loc20_;
      var _loc2_;
      var _loc3_;
      var _loc5_;
      var _loc14_;
      var _loc19_;
      var _loc18_;
      var _loc13_;
      var _loc11_;
      var _loc12_;
      var _loc10_;
      if(Math.abs(arc) > 360)
      {
         arc = 360;
      }
      _loc14_ = Math.ceil(Math.abs(arc) / 45);
      _loc20_ = arc / _loc14_;
      _loc2_ = (- _loc20_ / 180) * 3.141592653589793;
      _loc3_ = (- startAngle / 180) * 3.141592653589793;
      var _loc4_;
      if(_loc14_ > 0)
      {
         _loc19_ = x + Math.cos(startAngle / 180 * 3.141592653589793) * radius;
         _loc18_ = y + Math.sin((- startAngle) / 180 * 3.141592653589793) * yRadius;
         mc.lineTo(_loc19_,_loc18_);
         _loc4_ = 0;
         while(_loc4_ < _loc14_)
         {
            _loc3_ += _loc2_;
            _loc5_ = _loc3_ - _loc2_ / 2;
            _loc13_ = x + Math.cos(_loc3_) * radius;
            _loc11_ = y + Math.sin(_loc3_) * yRadius;
            _loc12_ = x + Math.cos(_loc5_) * (radius / Math.cos(_loc2_ / 2));
            _loc10_ = y + Math.sin(_loc5_) * (yRadius / Math.cos(_loc2_ / 2));
            mc.curveTo(_loc12_,_loc10_,_loc13_,_loc11_);
            _loc4_ = _loc4_ + 1;
         }
         mc.lineTo(x,y);
      }
   }
   static function drawArc(mc, x, y, radius, arc, startAngle, yRadius)
   {
      if(arguments.length < 5)
      {
         return null;
      }
      if(yRadius == undefined)
      {
         yRadius = radius;
      }
      var _loc17_;
      var _loc3_;
      var _loc2_;
      var _loc5_;
      var _loc14_;
      var _loc10_;
      var _loc8_;
      var _loc9_;
      var _loc7_;
      var _loc13_;
      var _loc12_;
      if(Math.abs(arc) > 360)
      {
         arc = 360;
      }
      _loc14_ = Math.ceil(Math.abs(arc) / 45);
      _loc17_ = arc / _loc14_;
      _loc3_ = (- _loc17_ / 180) * 3.141592653589793;
      _loc2_ = (- startAngle / 180) * 3.141592653589793;
      _loc10_ = x - Math.cos(_loc2_) * radius;
      _loc8_ = y - Math.sin(_loc2_) * yRadius;
      var _loc4_;
      if(_loc14_ > 0)
      {
         _loc4_ = 0;
         while(_loc4_ < _loc14_)
         {
            _loc2_ += _loc3_;
            _loc5_ = _loc2_ - _loc3_ / 2;
            _loc9_ = _loc10_ + Math.cos(_loc2_) * radius;
            _loc7_ = _loc8_ + Math.sin(_loc2_) * yRadius;
            _loc13_ = _loc10_ + Math.cos(_loc5_) * (radius / Math.cos(_loc3_ / 2));
            _loc12_ = _loc8_ + Math.sin(_loc5_) * (yRadius / Math.cos(_loc3_ / 2));
            mc.curveTo(_loc13_,_loc12_,_loc9_,_loc7_);
            _loc4_ = _loc4_ + 1;
         }
      }
      return {x:_loc9_,y:_loc7_};
   }
   static function calcGradient(hex, percent)
   {
      var _loc2_ = com.abowman.graphics.Draw.hexToRGB(hex);
      var _loc1_ = com.abowman.graphics.Draw.RGBToHLS(_loc2_.r,_loc2_.g,_loc2_.b);
      _loc1_.l *= percent / 100;
      if(_loc1_.l > 240)
      {
         _loc1_.l = 240;
      }
      if(_loc1_.l < 0)
      {
         _loc1_.l = 0;
      }
      _loc2_ = com.abowman.graphics.Draw.HLSToRGB(_loc1_.h,_loc1_.l,_loc1_.s);
      return com.abowman.graphics.Draw.RGBToHex(_loc2_.r,_loc2_.g,_loc2_.b);
   }
   static function hexToRGB(hex)
   {
      var _loc1_ = new Object();
      _loc1_.r = hex >> 16;
      var _loc2_ = hex ^ _loc1_.r << 16;
      _loc1_.g = _loc2_ >> 8;
      _loc1_.b = _loc2_ ^ _loc1_.g << 8;
      return _loc1_;
   }
   static function RGBToHex(r, g, b)
   {
      var _loc1_ = r << 16 ^ g << 8 ^ b;
      return _loc1_;
   }
   static function RGBToHLS(r, g, b)
   {
      var _loc9_;
      var _loc8_;
      var _loc7_;
      var _loc1_ = Math.max(Math.max(r,g),b) / 255;
      var _loc5_ = Math.min(Math.min(r,g),b) / 255;
      var _loc2_ = _loc1_ - _loc5_;
      _loc8_ = (_loc1_ + _loc5_) / 2;
      _loc7_ = _loc1_ != _loc5_ ? (_loc8_ > 0.5 ? _loc2_ / (2 - _loc8_ * 2) : _loc2_ / _loc8_ / 2) : 0;
      if(r / 255 == _loc1_)
      {
         _loc9_ = (g - b) / _loc2_ / 255;
      }
      else if(g / 255 == _loc1_)
      {
         _loc9_ = 2 + (b - r) / _loc2_ / 255;
      }
      else if(b / 255 == _loc1_)
      {
         _loc9_ = 4 + (r - g) / _loc2_ / 255;
      }
      _loc9_ *= 40;
      if(_loc9_ < 0)
      {
         _loc9_ += 240;
      }
      _loc9_ = Math.round(_loc9_);
      return {h:(!isNaN(_loc9_) ? _loc9_ : 0),l:Math.round(_loc8_ * 240),s:Math.round(_loc7_ * 240)};
   }
   static function HLSToRGB(h, l, s)
   {
      var _loc10_;
      var _loc11_;
      var _loc9_;
      var _loc2_;
      var _loc1_;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      if(s == 0)
      {
         _loc10_ = _loc11_ = _loc9_ = Math.round(l / 240 * 255);
      }
      else
      {
         h /= 240;
         l /= 240;
         s /= 240;
         _loc5_ = l >= 0.5 ? l + s - l * s : l * (s + 1);
         _loc4_ = l * 2 - _loc5_;
         _loc3_ = 0;
         while(_loc3_ < 3)
         {
            switch(_loc3_)
            {
               case 0:
                  _loc1_ = h + 0.3333333333333333;
                  break;
               case 1:
                  _loc1_ = h;
                  break;
               case 2:
                  _loc1_ = h - 0.3333333333333333;
            }
            if(_loc1_ < 0)
            {
               _loc1_ = _loc1_ + 1;
            }
            else if(_loc1_ > 1)
            {
               _loc1_ = _loc1_ - 1;
            }
            if(_loc1_ * 6 < 1)
            {
               _loc2_ = _loc4_ + (_loc5_ - _loc4_) * 6 * _loc1_;
            }
            else if(_loc1_ * 2 < 1)
            {
               _loc2_ = _loc5_;
            }
            else if(_loc1_ * 3 < 2)
            {
               _loc2_ = _loc4_ + (_loc5_ - _loc4_) * (0.6666666666666666 - _loc1_) * 6;
            }
            else
            {
               _loc2_ = _loc4_;
            }
            switch(_loc3_)
            {
               case 0:
                  _loc10_ = Math.round(_loc2_ * 255);
                  break;
               case 1:
                  _loc11_ = Math.round(_loc2_ * 255);
                  break;
               case 2:
                  _loc9_ = Math.round(_loc2_ * 255);
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      return {r:_loc10_,g:_loc11_,b:_loc9_};
   }
}
