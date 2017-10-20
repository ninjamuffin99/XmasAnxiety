package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ninjaMuffin
 */
class Player extends FlxSprite 
{

	private var speed:Float = 180;
	private var interacting:Bool = false;
	
	public var anxiety:Float = 1;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		var lanim = [24, 25, 26, 27, 28, 29, 30, 31];
		lanim.reverse();
		
		loadGraphic(AssetPaths.walkmc__png, true,  32, 64);
		animation.add("d", [0, 1, 2, 3, 4, 5, 6, 7], 8, true);
		animation.add("r", [8, 9, 10, 11, 12, 13, 14, 15], 8, true);
		animation.add("u", [16, 17, 18, 19, 20, 21, 22, 23], 8, true);
		animation.add("l", lanim, 8, true);
		
		height = 16;
		offset.y = 48;
		
		drag.x = drag.y = 550;
	}
	
	override public function update(elapsed:Float):Void 
	{
		controls();
		
		super.update(elapsed);
		
	}
	
	private function controls():Void
	{
		var _up = FlxG.keys.anyPressed([UP, W]);
		var _down = FlxG.keys.anyPressed([DOWN, S]);
		var _left = FlxG.keys.anyPressed([LEFT, A]);
		var _right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		
		if (_up || _down || _left || _right)
		{
			var mA:Float = 0;
			
			if (_up)
			{
				mA = -90;
				if (_left)
					mA -= 45;
				else if (_right)
					mA += 45;
				facing = FlxObject.UP;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
				facing = FlxObject.DOWN;
			}
			else if (_left)
			{
				facing = FlxObject.LEFT;
				mA = 180;
				animation.play("l");
			}
			else if (_right)
			{
				facing = FlxObject.RIGHT;
				mA = 0;
			}
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
			
			// did have && touching -- FlxObject.NONE, but I'd rather have this
			if ((velocity.x != 0 || velocity.y != 0))
			{
				switch(facing)
				{
					case FlxObject.LEFT:
						animation.play("l");
					case FlxObject.RIGHT:
						animation.play("r");
					case FlxObject.UP:
						animation.play("u");
					case FlxObject.DOWN:
						animation.play("d");
				}
			}
			else
			{
				animation.stop();
			}
			
		}
	}
	
}