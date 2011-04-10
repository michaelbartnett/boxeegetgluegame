package
{
	import com.greensock.TweenLite;
	
	import flash.external.ExternalInterface;
	
	import org.flixel.*;
	import org.flixel.data.FlxKeyboard;

	public class PlayState extends FlxState
	{
		[Embed(source="../assets/ship.png")] private static var ShipImg:Class;
		private var player:PlayerShip;
		
		private var enemyList:Vector.<TextEnemy> = new Vector.<TextEnemy>();
		private var enemyManager:EnemyManager;
		
		//Scrolling background
		[Embed(source="../assets/background.png")]private static var MainBackdrop:Class;
		private var bg1:FlxBackdrop = new FlxBackdrop(MainBackdrop, 0, 1);
		
		[Embed(source="../assets/backgroundOverlay.png")]private static var OverlayBackdrop:Class;
		private var bg2:FlxBackdrop = new FlxBackdrop(OverlayBackdrop, 0, 100);
		
		override public function create():void
		{
			player = new PlayerShip(0, 0, ShipImg);
			player.y = FlxG.height - player.frameHeight;
			player.MoveAcceleration = 200.0;
			GameData.ForegroundGroup.add(player);
			
			var s:String;
			try {
				s = ExternalInterface.call("getTextToShoot");
			} catch (e:Error) {
				FlxG.log("Error: " + e.message);
				FlxG.log("Adding dummy data.");
				s = "Power Rangers,Rugrats,Miley Cyrus,Gossip Girl,Jersey Shore,Chuck,Doctor Who,Star Trek,Priceline Negotiator";
			}
			
			var i:int = 1;
			for each (var enemy:String in s.split(",")) {
				var te:TextEnemy = new TextEnemy(FlxG.width / 2, -20, FlxG.width, enemy);
				te.visible = false;
				te.active = false;
				te.size = 24;
				GameData.ForegroundGroup.add(te);
				enemyList.push(te);
				i++;
			}
			
			enemyManager = new EnemyManager(enemyList);
			
			add(GameData.BackgroundGroup);
			add(GameData.BulletGroup);
			add(GameData.ForegroundGroup);
			
			
			GameData.BackgroundGroup.add(bg1);
			GameData.BackgroundGroup.add(bg2);
		}
		
		override public function update():void
		{
			super.update();
			
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
			if (FlxG.keys.justPressed("SPACE")) {
				player.shoot();
			}
			if (FlxG.keys.justPressed("E")) {
				enemyManager.sendOneOff(2.0);
			}
		}
	}
}
