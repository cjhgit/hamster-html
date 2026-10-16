class com.abowman.math.Trig
{
   static var piBy180 = 0.017453292519943295;
   function Trig()
   {
   }
   static function angleTo(x, y, toX, toY)
   {
      var _loc2_ = toX - x;
      var _loc1_ = toY - y;
      return Math.atan2(_loc1_,_loc2_);
   }
   static function distTo(x, y, toX, toY)
   {
      var _loc2_ = toX - x;
      var _loc1_ = toY - y;
      return Math.sqrt(_loc2_ * _loc2_ + _loc1_ * _loc1_);
   }
   static function fixAngle(angle)
   {
      angle %= 6.283185307179586;
      return angle >= 0 ? angle : angle + 6.283185307179586;
   }
   static function fixAngleDeg(angle)
   {
      angle %= 360;
      return angle >= 0 ? angle : angle + 360;
   }
   static function angleToDeg(x1, y1, x2, y2)
   {
      var _loc1_ = y2 - y1;
      var _loc2_ = x2 - x1;
      return Math.atan2(_loc1_,_loc2_) / 0.017453292519943295;
   }
}
