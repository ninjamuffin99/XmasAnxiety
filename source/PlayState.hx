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
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _cameraFocus:FlxSprite;
	
	private var _grpNPCs:FlxTypedGroup<NPC>;
	private var _grpPickupSpots:FlxTypedGroup<PickupSpot>;
	
	
	private var _map:TiledMap;
	public var _mWalls:FlxTilemap;
	
	private var _camZoom:Float = 0.7;
	
	private var _anxietyText:FlxText;
	
	private var _peopleCount:Int;
	
	private var _list:Array<String>;
	private var _listText:FlxText;
	
	override public function create():Void
	{
		_cameraFocus = new FlxSprite();
		_cameraFocus.makeGraphic(1, 1);
		add(_cameraFocus);
		
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
		
		_peopleCount = FlxG.random.int(100, 600);
		FlxG.log.add("people added: " + _peopleCount);
		while (_peopleCount > 0)
		{
			_grpNPCs.add(new NPC(FlxG.random.float(32, _mWalls.width), FlxG.random.float(32, _mWalls.height)));
			_peopleCount -= 1;
		}
		
		
		_grpPickupSpots = new FlxTypedGroup<PickupSpot>();
		add(_grpPickupSpots);
		
		var tmpMap:TiledObjectLayer = cast _map.getLayer("entities");
		for (e in tmpMap.objects)
		{
			placeEntities(e.type, e.xmlData.x);
		}
		
		//FlxG.camera.zoom = _camZoom;
		FlxG.camera.follow(_player, LOCKON, 0.1);
		FlxG.camera.followLead.x = FlxG.camera.followLead.y = 30;
		//FlxG.worldBounds.set(0, 0, _map.width, _map.height);
		
		createHUD();
		
		FlxG.sound.play(AssetPaths.crowdAmbient__mp3, 0.7, true);
		
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
		if (entityName == "pickups")
		{
			_grpPickupSpots.add(new PickupSpot(x, y));
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
		
		_list = Reg.items;
		FlxG.random.shuffle(_list);
		
		_listText = new FlxText(20, 350, 0, Std.string(_list), 20);
		add(_listText);
		
		_anxietyText.scrollFactor.x = _anxietyText.scrollFactor.y = 0;
		_listText.scrollFactor.x = _listText.scrollFactor.y = 0;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		controls();
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_grpNPCs, _mWalls);
		
		_grpNPCs.forEachAlive(checkNPCVision);
		
		_grpPickupSpots.forEachAlive(pickupItem);
		
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
	
	private function pickupItem(pickupSpot:PickupSpot):Void
	{
		if (FlxG.overlap(pickupSpot, _player) && FlxG.keys.justReleased.SPACE)
		{
			pickupSpot.kill();
			_list.splice(FlxG.random.int(0, _list.length), 1);
			_listText.text = Std.string(_list);
		}
	}
}