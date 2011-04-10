package
{
	import com.greensock.TweenLite;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class PlayerShip extends FlxSprite
	{
		private var horizontalMove:int = 0;
		public var MoveAcceleration:Number = 0;
		public var Bullets:Vector.<Bullet>;
		
		public function PlayerShip(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			Bullets = new Vector.<Bullet>();
		}
	
		public function shoot():void
		{
			var bullet:Bullet = new Bullet(x + 1 + frameWidth / 2, y);
			GameData.BulletGroup.add(bullet);
			TweenLite.to(bullet, 1.5, {y:0});
		}
		
		public function moveLeft():void
		{
			
			velocity.x = -MoveAcceleration;
		}
		
		public function moveRight():void
		{
			velocity.x = MoveAcceleration;	
		}
		
		override public function update():void
		{
			super.update();
			checkBounds();
			
			velocity.x = 0;
		}
		
		private function checkBounds():void
		{
			if (x < 0) {
				x = 0;
			}
			if (x + frameWidth > FlxG.width) {
				x = FlxG.width - frameWidth;
			}
		}
	}
}