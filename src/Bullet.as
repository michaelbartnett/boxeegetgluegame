package
{
	import com.greensock.TweenLite;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class Bullet extends FlxSprite
	{
		[Embed(source="../assets/bullet.png")] private static var BulletImg:Class;
		public var Tweener:TweenLite;

		public function Bullet(X:Number=0, Y:Number=0)
		{
			super(X, Y, BulletImg);
			offset.x = frameWidth / 2;
		}
		
		public function explode():void
		{
			Tweener.kill();
			this.active = false;
			this.visible = false;
		}
	}
}