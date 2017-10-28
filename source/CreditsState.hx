package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ninjaMuffin
 */
class CreditsState extends FlxState 
{

	override public function create():Void 
	{
		var creds:FlxText;
		
		creds = new FlxText(40, 40, 0, "Programming, Design, and Additional Art:\nninjamuffin99\n\nArt and Design:\naninvisiblepirate\n\nPA Voice and HUNK:\nSaminat\n\n\n\nMade using the HaxeFlixel framework\nwith the Tiled Map Editor\n\nProject source code:", 16);
		add(creds);
		
		var _btnTwitter1:FlxButton = new FlxButton(190, 62, "Twitter", function(){FlxG.openURL("https://twitter.com/ninja_muffin99"); });
		add(_btnTwitter1);
		
		var _btnTwitter2:FlxButton = new FlxButton(215, 122, "Twitter", function(){FlxG.openURL("https://twitter.com/72robots"); });
		add(_btnTwitter2);
		
		var _btnTwitter3:FlxButton = new FlxButton(145, 182, "Twitter", function(){FlxG.openURL("https://twitter.com/ngsaminat"); });
		add(_btnTwitter3);
		
		var _btnOther1:FlxButton = new FlxButton(190 + 95, 62, "Newgrounds", function(){FlxG.openURL("https://ninjamuffin99.newgrounds.com/"); });
		add(_btnOther1);
		
		var _btnOther2:FlxButton = new FlxButton(215 + 95, 122, "Instagram", function(){FlxG.openURL("https://www.instagram.com/colleen.loges/"); });
		add(_btnOther2);
		
		var _btnOther2NG:FlxButton = new FlxButton(215 + 95 + 95, 122, "Newgrounds", function(){FlxG.openURL("https://aninvisiblepirate.newgrounds.com/"); });
		add(_btnOther2NG);
		
		var _btnOther3:FlxButton = new FlxButton(145 + 95, 182, "Newgrounds", function(){FlxG.openURL("https://saminat.newgrounds.com/"); });
		add(_btnOther3);
		
		
		
		var _btnHF:FlxButton = new FlxButton(130, 262, "HaxeFlixel", function(){lxG.openURL("http://haxeflixel.com/"); });
		add(_btnHF);
		
		var _btnTiled:FlxButton = new FlxButton(130 + 95, 262, "Tiled", function(){lxG.openURL("http://www.mapeditor.org/"); });
		add(_btnTiled);
		
		var _btnSource:FlxButton = new FlxButton(130, 322, "HaxeFlixel", function(){lxG.openURL("https://github.com/ninjamuffin99/XmasAnxiety"); });
		add(_btnSource);
		
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