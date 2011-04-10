package
{
	import flash.external.ExternalInterface;
	
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="../assets/ship.png")] private var ShipImg:Class;
		private var player:PlayerShip;
		
		private var playerText:FlxText = new FlxText(200, 350, FlxG.width - 200, "PLAYERPOS:");
		
		private var enemyList:Vector.<TextEnemy> = new Vector.<TextEnemy>();
		
		
		override public function create():void
		{
			add(new FlxText(0,0,100,"INSERT GAME HERE"));
		
			player = new PlayerShip(0, 0, ShipImg);
			player.y = FlxG.height - player.frameHeight;
			player.MoveAcceleration = 200.0;
			add(player);
			
			var s:String = ExternalInterface.call("getTextToShoot");
			
			var i:int = 1;
			for each (var enemy:String in s.split(",")) {
				add(new TextEnemy(0, 30 * i, FlxG.width, enemy));
				i++;
			}
			
			add(playerText);
		}
		
		override public function update():void
		{
			super.update();
			
			playerText.text = "PLAYERPOS: " + player.x + "," + player.y + "\nOFFSET: " + player.offset.x + "," + player.offset.y;
			
			handleInput();
		}
		
		public function handleInput():void
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
