package
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class PlayerShip extends FlxSprite
	{
		private var horizontalMove:int = 0;
		public var MoveAcceleration:Number = 0;
		
		public function PlayerShip(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
		}
	
		public function shoot():void
		{
			
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