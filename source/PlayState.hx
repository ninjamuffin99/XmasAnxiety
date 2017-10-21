package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _grpNPCs:FlxTypedGroup<NPC>;
	
	
	private var _map:TiledMap;
	private var _mWalls:FlxTilemap;
	
	private var _camZoom:Float = 0.7;
	
	private var _anxietyText:FlxText;
	
	override public function create():Void
	{
		_map = new TiledMap(AssetPaths.walmart__tmx);
		_mWalls = new FlxTilemap();
		_mWalls.loadMapFromArray(cast(_map.getLayer("walls"), TiledTileLayer).tileArray, _map.width, _map.height, AssetPaths.tiles__png, _map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		_mWalls.follow();
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(3, FlxObject.ANY);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_grpNPCs = new FlxTypedGroup<NPC>();
		add(_grpNPCs);
		
		var tmpMap:TiledObjectLayer = cast _map.getLayer("entities");
		for (e in tmpMap.objects)
		{
			placeEntities(e.type, e.xmlData.x);
		}
		
		//FlxG.camera.zoom = _camZoom;
		FlxG.camera.follow(_player, LOCKON);
		//FlxG.worldBounds.set(0, 0, _map.width, _map.height);
		
		createHUD();
		
		super.create();
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
		}
		else if (entityName == "npc")
		{
			_grpNPCs.add(new NPC(x, y));
		}
	}
	
	private function createHUD():Void
	{
		_anxietyText = new FlxText(20, 20, 0, "anxiety: ", 30);
		add(_anxietyText);
		
		_anxietyText.scrollFactor.x = _anxietyText.scrollFactor.y = 0;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		controls();
		FlxG.collide(_player, _mWalls);
		
		_grpNPCs.forEachAlive(checkNPCVision);
		
		_anxietyText.text = "Anxiety: " + _player.anxiety;
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
	
	private function checkNPCVision(npc:NPC):Void
	{
		if (_mWalls.ray(npc.getMidpoint(), _player.getMidpoint()) && FlxMath.isDistanceWithin(_player, npc, 200))
		{
			_player.anxiety += 0.1;
		}
	}
}