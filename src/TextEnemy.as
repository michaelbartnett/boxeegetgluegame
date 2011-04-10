package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	public class TextEnemy extends FlxObject
	{
		private var textObj:FlxText;
		
		public function TextEnemy(X:Number, Y:Number, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y);
			textObj = new FlxText(X, Y, FlxG.width, Text, EmbeddedFont);
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
			
		}
		
		private function updateDimensions():void
		{
			this.width = textObj.frameWidth;
			this.health = textObj.frameHeight;
		}
	}
}