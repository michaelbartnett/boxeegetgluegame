package
{
	import flash.external.ExternalInterface;
	
	import org.flixel.*;
	import org.flixel.data.FlxKeyboard;

	public class PlayState extends FlxState
	{
		[Embed(source="../assets/ship.png")] private static var ShipImg:Class;
		private var player:PlayerShip;
		
		private var playerText:FlxText = new FlxText(200, 350, FlxG.width - 200, "PLAYERPOS:");
		private var debugLText:FlxText = new FlxText(200, 200, FlxG.width, "LEFT!!");
		private var debugRText:FlxText = new FlxText(200, 220, FlxG.width, "RIGHT!!");
		private var debugSText:FlxText = new FlxText(200, 240, FlxG.width, "SPACET!!");
		
		private var enemyList:Vector.<TextEnemy> = new Vector.<TextEnemy>();
		
		
		override public function create():void
		{
			add(new FlxText(0,0,100,"INSERT GAME HERE"));
			player = new PlayerShip(0, 0, ShipImg);
			player.y = FlxG.height - player.frameHeight;
			player.MoveAcceleration = 200.0;
			add(player);
			
//			try {
				var s:String = ExternalInterface.call("getTextToShoot");
				
				var i:int = 1;
				for each (var enemy:String in s.split(",")) {
					add(new TextEnemy(0, 30 * i, FlxG.width, enemy));
					i++;
				}
//			} catch (e:Error) {
//				FlxG.log("Error: " + e.message);
//				add(new FlxText(300, 300, FlxG.width, "GOT AN ERROR"));
//			}
			
			add(playerText);
			add(debugLText);
			add(debugRText);
			add(debugSText);
		}
		
		override public function update():void
		{
			super.update();
			
			playerText.text = "PLAYERPOS: " + player.x + "," + player.y + "\nOFFSET: " + player.offset.x + "," + player.offset.y;
			
			handleInput();
		}
		
		public function handleInput():void
		{
			debugLText.visible = false;
			debugSText.visible = false;
			debugRText.visible = false;
			if (FlxG.keys.LEFT) {
				player.moveLeft();
				debugLText.visible = true;
			}
			if (FlxG.keys.RIGHT) {
				player.moveRight();
				debugRText.visible = true;
			}
			if (FlxG.keys.SPACE) {
				player.shoot();
				debugSText.visible = true;
			}
		}
	}
}
