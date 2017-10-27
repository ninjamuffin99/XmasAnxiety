package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class PickupSpot extends FlxSprite 
{
	public var _itemType:String;
	
	public function new(?X:Float=0, ?Y:Float=0, ?itemType:String) 
	{
		super(X, Y);
		loadGraphic("assets/images/pickupSprite.png", true, 16, 16);
		animation.add("idle", [0, 1, 0], 12);
		animation.play("idle");
		
		_itemType = itemType;
		
		FlxG.log.add(itemType);
	}
	
}