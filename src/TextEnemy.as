package
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	public class TextEnemy extends FlxText
	{
		
		public function TextEnemy(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y, Width, Text, EmbeddedFont);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function explode():void
		{
			addAnimation("explo1.png", [8], 12, false);
		}
	}
}