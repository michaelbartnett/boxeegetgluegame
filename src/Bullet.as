package
{
	import org.flixel.FlxSprite;

	public class Bullet extends FlxSprite
	{
		[Embed(source="../assets/bullet.png")] private static var BulletImg:Class;

		public function Bullet(X:Number=0, Y:Number=0)
		{
			super(X, Y, BulletImg);
			offset.x = frameWidth / 2;
		}
	}
}