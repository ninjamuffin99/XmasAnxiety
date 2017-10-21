package;

import flixel.FlxG;
import flixel.FlxSprite;
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

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(32, 64, FlxColor.RED);
		
		_brain = new FSM(idle);
		_idleTmr = 0;
	}
	
	public function idle():Void
	{
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
	
	override public function update(elapsed:Float):Void 
	{
		_brain.update();
		
		super.update(elapsed);
	}
}