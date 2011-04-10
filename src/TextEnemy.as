package
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	public class TextEnemy extends FlxText
	{
		public var UpdatePositionAI:Function;
		
		public function TextEnemy(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y, Width, Text, EmbeddedFont);
		}
		
		override public function update():void
		{
			super.update();
			
			var newPos:FlxPoint = UpdatePositionAI(this.x, this.y);
			this.x = newPos.x;
			this.y = newPos.y;
		}
	}
}