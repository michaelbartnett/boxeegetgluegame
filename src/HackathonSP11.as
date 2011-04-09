package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class HackathonSP11 extends FlxGame
	{
		public function HackathonSP11()
		{
			super(1280,720,MenuState,2);
		}
	}
}
