package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class TextEnemy extends FlxObject
	{
		[Embed(source="../assets/explo1.png")] private static var ExplosionImg:Class;
		private var sprite:FlxSprite;
		private var textObj:FlxText;
		
		public function TextEnemy(X:Number, Y:Number, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y);
			textObj = new FlxText(X, Y, FlxG.width, Text, EmbeddedFont);
			sprite.loadGraphic(ExplosionImg);
			GameData.ForegroundGroup.add(textObj);
			updateDimensions();
			this.width = textObj.frameWidth;
			this.solid = true;
			this.active = true;
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
			sprite.addAnimation("explo1.png", [8], 12, false);
		}
		
		private function updateDimensions():void
		{
			this.width = textObj.TextWidth;
			this.height = textObj.TextHeight;
		}
	}
}