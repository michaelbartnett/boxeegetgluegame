package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="../assets/temporary_ship.png")] private var ShipImg:Class;
		private var player:PlayerShip;
		
		private var enemyList:Vector.<FlxText> = new Vector.<FlxText>();
		
		
		override public function create():void
		{
			add(new FlxText(0,0,100,"INSERT GAME HERE"));
		
			player = new PlayerShip(0, 200, ShipImg);
			player.scale = new FlxPoint(0.25, 0.25);
			player.MoveAcceleration = 200.0;
			add(player);
		}
		
		override public function update():void
		{
			super.update();
			handleInput();
		}
		
		public function handleInput()
		{
			if (FlxG.keys.LEFT) {
				player.moveLeft();
			}
			if (FlxG.keys.RIGHT) {
				player.moveRight();
			}
			if (FlxG.keys.SPACE) {
				player.shoot();
			}
			
		}
	}
}
