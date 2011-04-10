package
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quart;
	
	import org.flixel.FlxG;
	import org.flixel.FlxU;

	public class EnemyManager
	{
		private var enemyList:Vector.<TextEnemy> = new Vector.<TextEnemy>();
		
		public function EnemyManager(enemies:Vector.<TextEnemy>)
		{
			enemyList = enemies;
		}
		
		public function sendOneOff(speed:Number):void
		{
			for each (var enemy:TextEnemy in enemyList) {
				if (!enemy.active) {
					enemy.active = true;
					enemy.visible = true;
//					enemy.x = FlxU.random() * (FlxG.width - 50) + 25;
					enemy.x = 50;
					enemy.y = -enemy.frameHeight;
//					FlxG.log("Sending an enemy off! (" + enemy.text + ")");
					
					TweenLite.to(enemy, speed, {y:FlxG.height, ease:Quart.easeIn,
						onComplete: function():void {
							enemy.visible = false;
							enemy.active = false;
//							FlxG.log("enemy: '" + enemy.text + "' has finished moving.");
						}
					});
					break;
				}
			}
		}
	}
}