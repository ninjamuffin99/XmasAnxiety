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
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var _player:Player;
	
	public var _grpNPCs:FlxTypedGroup<NPC>;
	public var _grpPickupSpots:FlxTypedGroup<PickupSpot>;
	public var _grpOOB:FlxGroup;
	
	public var _map:TiledLevel;
	
	private var _camZoom:Float = 0.7;
	
	private var _anxietyText:FlxText;
	
	private var _peopleCount:Int;
	
	private var _list:Array<String>;
	private var _listText:FlxText;
	
	private var _timer:Float;
	private var _timerText:FlxText;
	
	private var _music:FlxSound;
	private var _heart:FlxSound;
	private var _playingPA:Bool = false;
	
	private var _doneShopping:Bool = false;
	
	//exit really but using Floor for convienience
	public var floor:FlxObject;
	
	override public function create():Void
	{
		FlxG.log.add("playstate chaekced");
		
		_grpPickupSpots = new FlxTypedGroup<PickupSpot>();
		_grpOOB = new FlxGroup();
		
		_map = new TiledLevel("assets/data/walmartReal.tmx", this);
		
		FlxG.log.add("after map loaded");
		
		
		add(_map.backgroundLayer);
		
		add (_map.imagesLayer);
		
		add(_map.foregroundTiles);
		add(_map.BGObjects);
		add(_map.foregroundObjects);
		add(_grpPickupSpots);
		add(_map.objectsLayer);
		
		add(_grpOOB);
		FlxG.log.add("after layers Loded");
		
		_grpNPCs = new FlxTypedGroup<NPC>();
		add(_grpNPCs);
		
		_peopleCount = FlxG.random.int(400, 600);
		FlxG.log.add("people added: " + _peopleCount);
		while (_peopleCount > 0)
		{
			_grpNPCs.add(new NPC(FlxG.random.float(32, _map.fullWidth), FlxG.random.float(32, _map.fullHeight)));
			_peopleCount -= 1;
		}
		
		
		
		/*
		var tmpMap:TiledObjectLayer = cast _map.getLayer("entities");
		for (e in tmpMap.objects)
		{
			placeEntities(e.type, e.xmlData.x);
		}
		*/
		//FlxG.camera.zoom = _camZoom;
		FlxG.camera.follow(_player, LOCKON, 0.1);
		FlxG.camera.followLead.x = FlxG.camera.followLead.y = 30;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		//FlxG.worldBounds.set(0, 0, _map.width, _map.height);
		
		FlxG.log.add(_map.collidableTileLayers);
		
		createHUD();
		
		FlxG.sound.play(AssetPaths.crowdAmbient__mp3, 0.4, true);
		
		_music = new FlxSound();
		_music.loadEmbedded("assets/music/Wish BackgroundEdited.mp3", true, false);
		_music.volume = 0.5;
		add(_music);
		_music.play();
		
		_heart = new FlxSound();
		_heart.loadEmbedded(AssetPaths.heartBeatSFX__mp3, true);
		_heart.volume = 0;
		add(_heart);
		_heart.play();
		
		FlxG.log.add("bottom of create");
		
		//FlxG.log.add(_grpPickupSpots);
		
		_grpNPCs.forEachExists(checkOOB);
		
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
		/* some bullshit
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
		else if (entityName == "pickups")
		{
			_grpPickupSpots.add(new PickupSpot(x, y));
		}
		*/
	}
	
	private function createHUD():Void
	{
		_anxietyText = new FlxText(20, 20, 0, "anxiety: ", 30);
		add(_anxietyText);
		
		_list = Reg.items;
		FlxG.random.shuffle(_list);
		
		_listText = new FlxText(20, 350, 550, "Shopping list: \n" + Std.string(_list), 20);
		add(_listText);
		
		_anxietyText.scrollFactor.x = _anxietyText.scrollFactor.y = 0;
		_listText.scrollFactor.x = _listText.scrollFactor.y = 0;
		
		_timer = 390;
		_timerText = new FlxText(20, 60, 0, Std.string(_timer), 25);
		add(_timerText);
		_timerText.scrollFactor.x = _timerText.scrollFactor.y = 0;
		
		_timerText.color = FlxColor.BLACK;
		_anxietyText.color = FlxColor.BLACK;
		_listText.color = FlxColor.BLACK;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_timer -= FlxG.elapsed;
		_timerText.text = "0:" + Std.string(Math.floor(FlxMath.remapToRange(_timer, 0, 390, 0, 60)) + " mins until closing!");
		
		if (FlxMath.inBounds(_timer, 110, 110.5) && !_playingPA)
		{
			_music.fadeOut(2, 0.2);
			FlxG.sound.play("assets/sounds/attention" + FlxG.random.int(1, 8) + ".mp3", 0.7, false, null, true, function()
			{
				FlxG.sound.play("assets/sounds/buttonHangUp.mp3", 0.2);
				_music.fadeIn(1, 0.2, 0.5);
			});
			_playingPA = true;
		}
		
		_map.collideWithLevel(_player);
		//_map.collideWithLevel(_grpNPCs);
		FlxG.collide(_grpNPCs, _map.foregroundObjects);
		FlxG.collide(_grpNPCs, _map.foregroundTiles);
		
		
		_grpNPCs.forEachAlive(checkNPCVision);
		/*
		_grpNPCs.forEachAlive(_mapLeaveCheck);
		*/	
		_player.anxiety -= 0.0365;
		
		if (_player.anxiety >= 99 || _timer <= 2)
		{
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){FlxG.switchState(new DeadState());});
			
		}
		
		_grpPickupSpots.forEachAlive(pickupItem, true);
		
		_anxietyText.text = "Anxiety: " + Math.floor(_player.anxiety);
		
		if (_list.length == 0)
		{
			_doneShopping = true;
		}
		FlxG.watch.addQuick("done hsoppong", _doneShopping);
		
		_heart.volume = FlxMath.remapToRange(_player.anxiety, 1, 100, 0, 1);
		
		if (_player.y >= 3160 && _doneShopping)
		{
			FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){FlxG.switchState(new CreditsState()); });
		}
	}
	
	private function checkOOB(npc:NPC):Void
	{
		while (FlxG.overlap(npc, _grpOOB))
		{
			npc.setPosition(FlxG.random.float(32, _map.fullWidth), FlxG.random.float(32, _map.fullHeight));
		}
	}
	
	
	private function checkNPCVision(npc:NPC):Void
	{
		
		if (_map.collidableTileLayers[2].ray(npc.getMidpoint(), _player.getMidpoint()) && FlxMath.isDistanceWithin(_player, npc, 115))
		{
			_player.anxiety += 0.087;
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
			_list.remove(pickupSpot._itemType);
			FlxG.sound.play("assets/sounds/pickUpSound.wav", 0.5);
			pickupSpot.kill();
			_listText.text = "Shopping list: \n" + Std.string(_list);
			
			if (_list.length == 0)
			{
				_listText.text = "Leave the store!";
			}
		}
		
	}
}