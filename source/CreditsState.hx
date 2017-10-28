package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ninjaMuffin
 */
class CreditsState extends FlxState 
{

	override public function create():Void 
	{
		var creds:FlxText;
		
		creds = new FlxText(40, 40, 0, "Programming, Design, and Additional Art:\nninjamuffin99\n\nArt and Design:\naninvisiblepirate\n\nPA Voice and HUNK:\nSaminate", 18);
		add(creds);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justReleased.ANY || FlxG.mouse.justReleased)
		{
			FlxG.switchState(new MenuState());
		}
		
	}
	
}