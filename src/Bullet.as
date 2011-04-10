package
{
	import org.flixel.FlxSprite;
	
	public class Bullet extends FlxSprite
	{
		[Embed(source="../assets/bullet.png")] private static var BulletImg;
		
		public function Bullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
		}
	}
}