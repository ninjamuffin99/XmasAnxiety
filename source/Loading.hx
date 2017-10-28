package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class Loading extends FlxState 
{
	override public function create():Void 
	{
		var whatever:FlxText;
		whatever = new FlxText(0, 0, 0, "You have one hour. \nBuy your family christmas presents. \nAvoid People", 24);
		whatever.screenCenter();
		add(whatever);
		
		FlxG.camera.fade(FlxColor.BLACK, 0.6, true);
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	
		if (FlxG.keys.justReleased.ANY)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.6, false, fadeOutThing);
		}
		
		
	}
	
	private function fadeOutThing():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}