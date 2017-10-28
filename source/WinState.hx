package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class WinState extends FlxState 
{

	override public function create():Void 
	{
		var _txtWin:FlxText = new FlxText(0, 0, 0,"YOU WIN\nThanks for playin yo\nThis was a game by aninvisiblepirate\nand ninjamuffin99\nThis outro was made very last minute have mercy...\nMERRY CHRISTMAS 5 BOMB THIS SHIIT\npress anything to return to title", 16);
		add(_txtWin);
		_txtWin.screenCenter();
		
		FlxG.sound.playMusic("assets/music/717685_Jingle-Bells-Iori-Licea-Co.mp3", 0.6);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		super.update(elapsed);
		
		if (FlxG.keys.justReleased.ANY)
		{
			FlxG.sound.music.fadeOut();
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){FlxG.switchState(new MenuState());});
			
		}
	}
}