#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/player.tsx");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/run debug.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/tileset.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/TilesOnly.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/TilesWalmartOnly.tsx");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/TilesWalmartV1.tsx");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/walmart.tmx");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/walmartReal.tmx");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/CheckOut.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/CheckOut.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/extras1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/frontShelf.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/LongShelvesSide.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/LongShelvesSide.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/McDonaldssss.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/McDonaldssss.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc10.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc11.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc7.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc8.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/npc9.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pickupSprite.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/pickupSprite.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/shelvesOpen.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/shelvesOpen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/SideShelves.ase");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/SideShelveSmall.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/thumbnailTitle.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tileset1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tileset1resized.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/titlebg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/titletype.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/walkmc.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/walmartRef.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/558953_Merry-Xmas-Erryone.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/music/681737_LOVE-ME.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/music/717685_Jingle-Bells-Iori-Licea-Co.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/music/music-goes-here - Copy.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/music/musicLisenceStuff.md");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/music/Wish BackgroundEdited.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention5.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention6.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention7.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/attention8.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/buttonHangUp.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/crowdAmbient.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/heartBeatSFX.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pickUpSound.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("flixel/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("flixel/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Monsterrat");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("flixel/images/ui/button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/images/logo/default.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "264",
			company: "ninjaMuffin",
			file: "XmasAnxiety",
			fps: 60,
			name: "XmasAnxiety",
			orientation: "",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 640,
					parameters: "{}",
					resizable: true,
					stencilBuffer: true,
					title: "XmasAnxiety",
					vsync: true,
					width: 900,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 900, 640, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		#if !flash
		if (openfl.Lib.current.stage.window.fullscreen) {
			
			openfl.Lib.current.stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
