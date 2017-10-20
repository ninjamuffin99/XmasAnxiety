package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _player:Player;
	
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	
	private var _camZoom:Float = 0.7;
	
	override public function create():Void
	{
		_map = new FlxOgmoLoader(AssetPaths.Walmart__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.zoom = _camZoom;
		FlxG.camera.follow(_player, LOCKON);
		
		super.create();
	}
	
	private function placeEntities(entityName:String, entityDate:Xml):Void
	{
		var x:Int = Std.parseInt(entityDate.get("x"));
		var y:Int = Std.parseInt(entityDate.get("y"));
		
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		controls();
		FlxG.collide(_player, _mWalls);
	}
	
	private function controls():Void
	{
		if (FlxG.keys.pressed.UP)
		{
			FlxG.camera.zoom += 0.01;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			FlxG.camera.zoom -= 0.01;
		}
	}
}