package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	private var _title:FlxSprite;
	private var _titleType:FlxSprite;
	
	private var _playGame:FlxButton;
	private var _btnCreds:FlxButton;
	
	private var _creds:FlxText;
	
	override public function create():Void
	{
		_title = new FlxSprite(0, 0);
		_title.loadGraphic(AssetPaths.titlebg__png, false, 435, 280);
		_title.setGraphicSize(FlxG.width, FlxG.height);
		_title.updateHitbox();
		_title.screenCenter();
		add(_title);
		
		_titleType = new FlxSprite();
		_titleType.loadGraphic(AssetPaths.titletype__png, false, 435, 280);
		_titleType.setGraphicSize(FlxG.width, FlxG.height);
		_titleType.screenCenter();
		add(_titleType);
		
		FlxTween.tween(_titleType, {y: _titleType.y + 20}, 0.9, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		
		
		_playGame = new FlxButton(20, 400, "Start", clickStart);
		add(_playGame);
		
		_btnCreds = new FlxButton(105, 400, "Credits", clickCreds);
		add(_btnCreds);
		
		FlxG.sound.play("assets/music/558953_Merry-Xmas-Erryone.mp3", 0.4, true);
		
		_creds = new FlxText(115, 8, 0, "ninjamuffin99 \n   and \n      aninvisibleprirate present...", 16);
		_creds.color = 0xF662230;
		add(_creds);
		FlxTween.tween(_creds, {y: _creds.y + 6}, 0.45, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickStart():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.6, false, function()
		{
			FlxG.switchState(new Loading());
		});
		FlxG.sound.music.fadeOut();
	}
	
	private function clickCreds():Void
	{
		FlxG.switchState(new CreditsState());
	}
}