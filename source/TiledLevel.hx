package;

import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledMap.FlxTiledMapAsset;

/**
 * ...
 * @author ninjaMuffin
 */
class TiledLevel extends TiledMap 
{
	
	private inline static var c_PATH_LEVEL_TILESHEETS = "assets/tiled/";

	public function new(tiledLevel:Dynamic, state:PlayState) 
	{
		super(tiledLevel);
		
	}
	
}