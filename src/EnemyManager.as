package
{
	import com.greensock.TweenLite;
	
	import org.flixel.FlxG;

	public class EnemyManager
	{
		private var enemyList:Vector.<TextEnemy> = new Vector.<TextEnemy>();
		private var enemyPointer:int = 0;
		
		public function EnemyManager(enemies:Vector.<TextEnemy>)
		{
			enemyList = enemies;
		}
		
		public function sendOneOff(speed:Number):void
		{
			var enemy:TextEnemy = enemyList[enemyPointer];
			enemy.active = true;
			enemy.visible = true;
			FlxG.log("Sending an enemy off! (" + enemy.text + ")");
			
			TweenLite.to(enemy, speed, {y:FlxG.height,
				onComplete: function():void {
					enemy.visible = false;
					enemy.active = false;
					FlxG.log("enemy: '" + enemy.text + "' has finished moving.");
				}
			});
			enemyPointer = enemyPointer + 1 >= enemyList.length ? 0 : enemyPointer + 1;
		}
	}
}