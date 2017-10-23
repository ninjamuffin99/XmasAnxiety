package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class NPC extends FlxSprite 
{
	private var _brain:FSM;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	private var speed:Float = 140;
	
	public var leaving:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(32, 64, FlxColor.RED);
		
		loadGraphic("assets/images/npc" + FlxG.random.int(1, 10) + ".png", true, 32, 64);
		
		var lanim = [24, 25, 26, 27, 28, 29, 30, 31];
		lanim.reverse();
		
		animation.add("d", [0, 1, 2, 3, 4, 5, 6, 7], 8, true);
		animation.add("r", [8, 9, 10, 11, 12, 13, 14, 15], 8, true);
		animation.add("u", [16, 17, 18, 19, 20, 21, 22, 23], 8, true);
		animation.add("l", lanim, 8, true);
		
		height = 16;
		offset.y = 48;
		
		_brain = new FSM(idle);
		_idleTmr = 0;
	}
	override public function draw():Void 
	{
		if ((velocity.x != 0 || velocity.y != 0 ) && touching == FlxObject.NONE)
		{
			if (Math.abs(velocity.x) > Math.abs(velocity.y))
            {
                 if (velocity.x < 0)
                    facing = FlxObject.LEFT;
                 else
                    facing = FlxObject.RIGHT;
            }
            else
            {
                if (velocity.y < 0)
                    facing = FlxObject.UP;
                else
                    facing = FlxObject.DOWN;
            }
            switch (facing)
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
		
		super.draw();
	}
	
	public function idle():Void
	{
		if (leaving)
		{
			_brain.activeState = leavingStore;
		}
		if (_idleTmr <= 0)
		{
			if (FlxG.random.bool(1))
			{
				_moveDir = -1;
				velocity.x = velocity.y = 0;
			}
			else
			{
				_moveDir = FlxG.random.int(0, 8) * 45;
				
				velocity.set(speed * 0.5, 0);
				velocity.rotate(FlxPoint.weak(), _moveDir);
			}
			_idleTmr = FlxG.random.int(1, 4);
		}
		else
			_idleTmr -= FlxG.elapsed;
	}
	
	public function leavingStore():Void
	{
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		_brain.update();
		
		super.update(elapsed);
	}
}