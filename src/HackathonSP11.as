package
{
	import org.flixel.*;
	[SWF(width="1280", height="720", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class HackathonSP11 extends FlxGame
	{
		public function HackathonSP11()
		{
			super(1280, 720, PlayState, 1);
		}
	}
}
