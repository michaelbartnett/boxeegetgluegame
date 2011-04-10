package
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class PlayerShip extends FlxSprite
	{
		private var horizontalMove:int = 0;
		public var MoveAcceleration:Number = 0;
		private var bulletSpeed:int = 2;
		private var numberOfBullets:int = 20;
		private var Bullets:Vector.<Bullet>;
		
		[Embed(source="../assets/ship.png")] private static var ShipImg:Class;
		
		[Embed(source = "../assets/shoot.mp3")] private static var ShootSnd:Class;
		private var shootSnd:FlxSound = new FlxSound();
		
		public function PlayerShip(X:Number=0, Y:Number=0)
		{
			super(X, Y, ShipImg);
			Bullets = new Vector.<Bullet>();
			for (var i:int = 0; i < numberOfBullets; i++)
			{
				var bullet:Bullet = new Bullet();
				bullet.active = false;
				bullet.visible = false;
				Bullets.push(bullet);
				GameData.BulletGroup.add(bullet);
			}
			
			shootSnd.loadEmbedded(ShootSnd);
		}
	
		public function shoot():void
		{
			for each (var bullet:Bullet in Bullets)
			{
				if (!bullet.active)
				{
					bullet.active = true;
					bullet.visible = true;
					bullet.x = x + 1 + frameWidth / 2;
//					bullet.y = y - 25;
					bullet.y = y;
					bullet.Tweener = TweenLite.to(bullet, bulletSpeed, {y:0, ease:Linear.easeNone,
						onComplete: function():void
						{
							bullet.visible = false;
							bullet.active = false;
						}
					});
					
					shootSnd.play();
					break;
				}
			}
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