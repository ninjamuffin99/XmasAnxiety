package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledImageTile;
import flixel.addons.editors.tiled.TiledLayer.TiledLayerType;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledMap.FlxTiledMapAsset;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledTilePropertySet;
import flixel.addons.editors.tiled.TiledTileSet;
import flixel.addons.tile.FlxTileSpecial;
import flixel.addons.tile.FlxTilemapExt;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import haxe.io.Path;

/**
 * ...
 * @author ninjaMuffin
 */
class TiledLevel extends TiledMap 
{
	
	private inline static var c_PATH_LEVEL_TILESHEETS = "assets/data/";
	
	public var foregroundTiles:FlxGroup;
	public var objectLayer:FlxGroup;
	public var backgroundLayer:FlxGroup;
	private var collidableTileLayers:Array<FlxTilemap>;
	
	public var imagesLayer:FlxGroup;

	public function new(tiledLevel:Dynamic, state:PlayState) 
	{
		super(tiledLevel);
		
		imagesLayer = new FlxGroup();
		foregroundTiles = new FlxGroup();
		objectLayer = new FlxGroup();
		backgroundLayer = new FlxGroup();
		
		FlxG.camera.setScrollBoundsRect(0, 0, fullWidth, fullHeight, true);
		
		loadImages();
		loadObjects(state);
		
		for (layer in layers)
		{
			if (layer.type != TiledLayerType.TILE) continue;
			var tileLayer:TiledTileLayer = cast layer;
			
			var tileSheetName:String = tileLayer.properties.get("tilesheet");
			
			if (tileSheetName == null)
				throw "'tileset' property not defined for the '" + tileLayer.name + "' layer. Please add the property to the layer.";
			
			var tileSet:TiledTileSet = null;
			for (ts in tilesets)
			{
				if (ts.name == tileSheetName)
				{
					tileSet = ts;
					break;
				}
			}
			
			if (tileSet == null)
				throw "Tileset '" + tileSheetName + " not found. Did you misspell the 'tilesheet' property in " + tileLayer.name + "' layer?";
			
			var imagePath = new Path(tileSet.imageSource);
			var processedPath = c_PATH_LEVEL_TILESHEETS + imagePath.file + "." + imagePath.ext;
			
			var tilemap = new FlxTilemapExt();
			tilemap.loadMapFromArray(tileLayer.tileArray, width, height, processedPath, tileSet.tileWidth, tileSet.tileHeight, OFF, tileSet.firstGID, 1, 1);
			
			if (tileLayer.properties.contains("animated"))
			{
				var tileset = tilesets["level"];
				var specialTiles:Map<Int, TiledTilePropertySet> = new Map();
				for (tileProp in tileset.tileProps)
				{
					if (tileProp != null && tileProp.animationFrames.length > 0)
					{
						specialTiles[tileProp.tileID + tileset.firstGID] = tileProp;
					}
				}
				var tileLayer:TiledTileLayer = cast layer;
				tilemap.setSpecialTiles([
						for (tile in tileLayer.tiles)
							if (tile != null && specialTiles.exists(tile.tileID))
								getAnimatedTile(specialTiles[tile.tileID], tileset)
							else null
				]);
			}
			
			if (tileLayer.properties.contains("nocollide"))
			{
				backgroundLayer.add(tilemap);
			}
			else
			{
				if (collidableTileLayers == null)
					collidableTileLayers = new Array<FlxTilemap>();
				foregroundTiles.add(tilemap);
				collidableTileLayers.push(tilemap);
			}
			
		}
	}
	
	private function getAnimatedTile(props:TiledTilePropertySet, tileset:TiledTileSet):FlxTileSpecial
	{
		var special = new FlxTileSpecial(1, false, false, 0);
		var n:Int = props.animationFrames.length;
		var offset = Std.random(n);
		special.addAnimation([for (i in 0...n) props.animationFrames[(i + offset) % n].tileID + tileset.firstGID], (1000 / props.animationFrames[0].duration));
		return special;
	}
	
	public function loadObjects(state:PlayState)
	{
		for (layer in layers)
		{
			if (layer.type != TiledLayerType.OBJECT)
				continue;
			var objectLayer:TiledObjectLayer = cast layer;
			
			if (layer.name == "images")
			{
				for (o in objectLayer.objects)
				{
					loadImageObject(o);
				}
			}
			
			if (layer.name == "objects")
			{
				for (o in objectLayer.objects)
				{
					loadObject(state, o, objectLayer, objectsLayer);
				}
			}
		}
	}
	
	private function loadImageObject(object:TiledObject)
	{
		var tilesImageCollection:TiledTileSet = this.getTileSet("imageCollection");
		var tileImageSource:TiledImageTile = tilesImageCollection.getImageSourceByGid(object.gid);
		
		var levelsDir:String = "assets/data/";
		
		var decoSprite:FlxSprite = new FlxSprite(0, 0, levelsDir + tileImageSource.source);
		if (decoSprite.width != object.width || decoSprite.height != object.height)
		{
			decoSprite.antialiasing = true;
			decoSprite.setGraphicSize(object.width, object.height);
		}
		if (object.flippedHorizontally)
		{
			decoSprite.flipX = true;
		}
		if (object.flippedVertically)
		{
			decoSprite.flipY = true;
		}
		decoSprite.setPosition(object.x, object.y - decoSprite.height);
		decoSprite.origin.set(0, decoSprite.height);
		if (object.angle != 0)
		{
			decoSprite.angle = object.angle;
			decoSprite.antialiasing = true;
		}
		
		if (object.properties.contains("depth"))
		{
			var depth = Std.parseFloat(object.properties.get("depth"));
			decoSprite.scrollFactor.set(depth, depth);
		}
		backgroundLayer.add(decoSprite);
	}
	
	private function loadObject(state:PlayState, o:TiledObject, g:TiledObjectLayer, group:FlxGroup)
	{
		var x:Int = o.x;
		var y:Int = o.y;
		
		if (o.gid != 1)
			y -= g.map.getGidOwner(o.gid).tileHeight;
		
		switch (o.type.toLowerCase())
		{
			case "player_start":
				var player = new Player(x, y);
				FlxG.camera.follow(player);
				state.player = player;
				group.add(player);
			case "floor":
				var floor = new FlxObject(x, y, o.width, o.height);
				state.floor = floor;
			case "coin":
				var tileset = g.map.getGidOwner(o.gid);
				var coin = new FlxSprite(x, y, c_PATH_LEVEL_TILESHEETS + tileset.imageSource);
				state.coins.add(coin);
			case "exit":
				var exit = new FlxSprite(x, y);
				exit.makeGraphic(32, 32);
				exit.exists = false;
				state.exit = exit;
				group.add(exit);
		}
	}
	
	public function loadImages()
	{
		for (layer in layers)
		{
			if (layer.type != TiledLayerType.IMAGE)
				continue;
			
			var image:TiledImageLayer = cast layer;
			var sprite = new FlxSprite(image.x, image.y, c_PATH_LEVEL_TILESHEETS + image.imagePath);
			imagesLayer.add(sprite);
		}
	}
	
	public function collideWithLevel(obj:FlxObject, ?notifyCallback:FlxObject->FlxObject->Void, ?processCallback:FlxObject->FlxObject->Bool):Bool
	{
		if (collidableTileLayers == null)
			return false;
		for (map in collidableTileLayers)
		{
			if (FlxG.overlap(map, obj, notifyCallback, processCallback != null ? processCallback : FlxObject.separate))
			{
				return true;
			}
		}
		return false;
	}
	
}