package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxPointer;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
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
	
	private var _timer:Float;
	private var _timerText:FlxText;
	
	private var _music:FlxSound;
	private var _playingPA:Bool = false;
	
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
		
		_peopleCount = FlxG.random.int(400, 600);
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
		
		FlxG.sound.play(AssetPaths.crowdAmbient__mp3, 0.5, true);
		
		_music = new FlxSound();
		_music.loadEmbedded("assets/music/Wish BackgroundEdited.mp3", true, false);
		add(_music);
		_music.play();
		
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
		if (entityName == "pickupsAppliance")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "appliance"));
		}
		if (entityName == "pickupsVideoGame")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "video game"));
		}
		if (entityName == "pickupsElectronic")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "electronic"));
		}
		if (entityName == "pickupsToy")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "toy"));
		}
		if (entityName == "pickupsFood")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "food"));
		}
		if (entityName == "pickupsClothing")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "clothing"));
		}
		if (entityName == "pickupsSportingGood")
		{
			_grpPickupSpots.add(new PickupSpot(x, y, "clothing"));
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
		
		_timer = 600;
		_timerText = new FlxText(20, 60, 0, Std.string(_timer), 25);
		add(_timerText);
		_timerText.scrollFactor.x = _timerText.scrollFactor.y = 0;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_timer -= FlxG.elapsed;
		_timerText.text = "0:" + Std.string(Math.floor(FlxMath.remapToRange(_timer, 0, 600, 0, 60)) + " mins until closing!");
		FlxG.watch.addQuick("timer realdeal", _timer);
		
		if (FlxMath.inBounds(_timer, 110, 110.5) && !_playingPA)
		{
			_music.fadeOut(2, 0.2);
			FlxG.sound.play("assets/sounds/attention" + FlxG.random.int(1, 8) + ".mp3", 0.7, false, null, true, function()
			{
				_music.fadeIn(1, 0.2, 1);
			});
			_playingPA = true;
		}
		
		if (FlxG.keys.justPressed.J)
			_timer = 120;
		
		controls();
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_grpNPCs, _mWalls);
		
		_grpNPCs.forEachAlive(checkNPCVision);
		_grpNPCs.forEachAlive(_mapLeaveCheck);
		
		_grpPickupSpots.forEachAlive(pickupItem);
		
		_player.anxiety -= 0.01;
		
		_anxietyText.text = "Anxiety: " + Math.floor(_player.anxiety);
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
		if (_mWalls.ray(npc.getMidpoint(), _player.getMidpoint()) && FlxMath.isDistanceWithin(_player, npc, 100))
		{
			_player.anxiety += 0.1;
		}
	}
	
	private function _mapLeaveCheck(npc:NPC):Void
	{
		/* super laggy
		if (FlxG.random.bool(1))
		{
			npc.leaving = true;
			
			var pathPoints:Array<FlxPoint> = _mWalls.findPath(
				FlxPoint.get(npc.x + npc.width / 2, npc.y + npc.height / 2),
				FlxPoint.get(1313, 3300)); // these are just values for doors on left side
			
			npc.path.start(pathPoints);
			FlxG.log.add("someone left");
		}
		*/
	}
	
	private function pickupItem(pickupSpot:PickupSpot):Void
	{
		if (FlxG.overlap(pickupSpot, _player) && FlxG.keys.justReleased.SPACE)
		{
			if (_list.remove(pickupSpot._itemType))
			pickupSpot.kill();
			_listText.text = Std.string(_list);
		}
	}
}