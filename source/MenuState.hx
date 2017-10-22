package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var _playGame:FlxButton;
	
	private var _creds:FlxText;
	
	override public function create():Void
	{
		
		_playGame = new FlxButton(20, 300, "Begin", clickStart);
		add(_playGame);
		
		_creds = new FlxText(20, 200, 0, "A game by ninjamuffin99 and aninvisiblepirate \nMade in a weekend", 10);
		add(_creds);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickStart():Void
	{
		FlxG.switchState(new PlayState());
	}
}