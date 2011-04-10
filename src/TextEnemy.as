package
{
	import com.greensock.TweenLite;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class TextEnemy extends FlxObject
	{
		[Embed(source="../assets/SPLOSION.png")] private static var ExplosionImg:Class;
		private var sprite:FlxSprite = new FlxSprite();
		private var textObj:FlxText;
		public var tweener:TweenLite;
		
		[Embed(source="../assets/explosion.mp3")] private static var ExplosionSnd:Class;
		private var explosionSound:FlxSound = new FlxSound();
		
		public function TextEnemy(X:Number, Y:Number, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y);
			textObj = new FlxText(X, Y, FlxG.width, Text, EmbeddedFont);
			sprite.loadGraphic(ExplosionImg, true, false, 522, 464, true);
			GameData.ForegroundGroup.add(textObj);
			GameData.ForegroundGroup.add(sprite);
//			sprite.visible = false;
			sprite.offset.x = sprite.frameWidth / 2;
			sprite.offset.y = sprite.frameHeight / 2;
			updateDimensions();
			this.width = textObj.frameWidth;
			this.solid = true;
			this.active = true;
			
			sprite.addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7], 12, false);
			sprite.addAnimationCallback(function():void { 
//				sprite.visible = false;
			});
			
			
			explosionSound.loadEmbedded(ExplosionSnd);
		}
		
		public function get text():String
		{
			return textObj.text;
		}
		
		public function set text(value:String):void
		{
			textObj.text = value;
			updateDimensions();
		}
		
		public function get frameWidth():Number { return textObj.frameWidth; }
		public function get frameHeight():Number { return textObj.frameHeight; }
		
		public function get size():Number { return textObj.size; }
		public function set size(value:Number):void
		{
			textObj.size = value;
			updateDimensions();
		}
		
		override public function update():void
		{
			super.update();
			textObj.visible = this.visible;
			textObj.x = this.x;
			textObj.y = this.y;
			textObj.active = this.active;
		}
		
		public function explode():void
		{
			sprite.visible = true;
			sprite.x = this.x + this.width / 2;
			sprite.y = this.y  - this.height / 2;
			sprite.update();
			sprite.play("explode");
			explosionSound.play();
			this.active = false;
			this.visible = false;
		}
		
		private function updateDimensions():void
		{
			this.width = textObj.TextWidth;
			this.height = textObj.TextHeight;
		}
	}
}