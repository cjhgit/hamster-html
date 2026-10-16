class Food extends MovieClip
{
   var active;
   var color;
   var pos;
   var radius;
   var vel;
   static var symbolName = "__Packages.Food";
   static var symbolLinked = Object.registerClass(Food.symbolName,Food);
   function Food()
   {
      super();
   }
   static function create(parent, depth, args)
   {
      var _loc1_ = Food(parent.attachMovie(Food.symbolName,"Food" + depth,depth));
      _loc1_.init(args);
      return _loc1_;
   }
   function init(args)
   {
      this.color = args.color;
      this.radius = args.radius;
      this.pos = {x:0,y:0};
      this.vel = {x:0,y:0};
      this.draw(this.radius);
   }
   function hide()
   {
      this.active = false;
      this._visible = false;
   }
   function draw(radius)
   {
      this.lineStyle(1);
      this.beginFill(this.color);
      com.abowman.graphics.Draw.drawOval(this,0,0,radius,radius);
      this.endFill();
   }
   function update()
   {
      this.pos.x += this.vel.x;
      this.pos.y += this.vel.y;
      this.pos.x = Math.max(this.pos.x,1);
      this.pos.x = Math.min(this.pos.x,Stage.width);
      this.pos.y = Math.max(this.pos.y,1);
      this.pos.y = Math.min(this.pos.y,Stage.height);
      this._x = this.pos.x;
      this._y = this.pos.y;
      if(this.active && !this._visible)
      {
         this._visible = true;
      }
   }
}
