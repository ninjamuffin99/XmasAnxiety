package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class DeadState extends FlxState 
{

	override public function create():Void 
	{
		var _dedText:FlxText = new FlxText(0, 0, 0, "You had to leave the store due to stress\nYou left empty handed.\nYour family hates you now\nTRY AGAIN", 16);
		add(_dedText);
		_dedText.screenCenter();
		
		FlxG.sound.playMusic("assets/music/681737_LOVE-ME.mp3", 0.8);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justReleased.ANY)
		{
			FlxG.sound.music.fadeOut();
			FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){FlxG.switchState(new MenuState()); });
		}
		
	}
	
}