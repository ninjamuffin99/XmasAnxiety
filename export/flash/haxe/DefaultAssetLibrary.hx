package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/player.tsx", __ASSET__assets_data_player_tsx);
		type.set ("assets/data/player.tsx", AssetType.TEXT);
		className.set ("assets/data/run debug.txt", __ASSET__assets_data_run_debug_txt);
		type.set ("assets/data/run debug.txt", AssetType.TEXT);
		className.set ("assets/data/tileset.png", __ASSET__assets_data_tileset_png);
		type.set ("assets/data/tileset.png", AssetType.IMAGE);
		className.set ("assets/data/TilesOnly.png", __ASSET__assets_data_tilesonly_png);
		type.set ("assets/data/TilesOnly.png", AssetType.IMAGE);
		className.set ("assets/data/TilesWalmartOnly.tsx", __ASSET__assets_data_tileswalmartonly_tsx);
		type.set ("assets/data/TilesWalmartOnly.tsx", AssetType.TEXT);
		className.set ("assets/data/TilesWalmartV1.tsx", __ASSET__assets_data_tileswalmartv1_tsx);
		type.set ("assets/data/TilesWalmartV1.tsx", AssetType.TEXT);
		className.set ("assets/data/walmart.tmx", __ASSET__assets_data_walmart_tmx);
		type.set ("assets/data/walmart.tmx", AssetType.TEXT);
		className.set ("assets/data/walmartReal.tmx", __ASSET__assets_data_walmartreal_tmx);
		type.set ("assets/data/walmartReal.tmx", AssetType.TEXT);
		className.set ("assets/images/CheckOut.ase", __ASSET__assets_images_checkout_ase);
		type.set ("assets/images/CheckOut.ase", AssetType.BINARY);
		className.set ("assets/images/CheckOut.png", __ASSET__assets_images_checkout_png);
		type.set ("assets/images/CheckOut.png", AssetType.IMAGE);
		className.set ("assets/images/extras1.png", __ASSET__assets_images_extras1_png);
		type.set ("assets/images/extras1.png", AssetType.IMAGE);
		className.set ("assets/images/frontShelf.ase", __ASSET__assets_images_frontshelf_ase);
		type.set ("assets/images/frontShelf.ase", AssetType.BINARY);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/LongShelvesSide.ase", __ASSET__assets_images_longshelvesside_ase);
		type.set ("assets/images/LongShelvesSide.ase", AssetType.BINARY);
		className.set ("assets/images/LongShelvesSide.png", __ASSET__assets_images_longshelvesside_png);
		type.set ("assets/images/LongShelvesSide.png", AssetType.IMAGE);
		className.set ("assets/images/McDonaldssss.ase", __ASSET__assets_images_mcdonaldssss_ase);
		type.set ("assets/images/McDonaldssss.ase", AssetType.BINARY);
		className.set ("assets/images/McDonaldssss.png", __ASSET__assets_images_mcdonaldssss_png);
		type.set ("assets/images/McDonaldssss.png", AssetType.IMAGE);
		className.set ("assets/images/npc1.png", __ASSET__assets_images_npc1_png);
		type.set ("assets/images/npc1.png", AssetType.IMAGE);
		className.set ("assets/images/npc10.png", __ASSET__assets_images_npc10_png);
		type.set ("assets/images/npc10.png", AssetType.IMAGE);
		className.set ("assets/images/npc11.png", __ASSET__assets_images_npc11_png);
		type.set ("assets/images/npc11.png", AssetType.IMAGE);
		className.set ("assets/images/npc2.png", __ASSET__assets_images_npc2_png);
		type.set ("assets/images/npc2.png", AssetType.IMAGE);
		className.set ("assets/images/npc3.png", __ASSET__assets_images_npc3_png);
		type.set ("assets/images/npc3.png", AssetType.IMAGE);
		className.set ("assets/images/npc4.png", __ASSET__assets_images_npc4_png);
		type.set ("assets/images/npc4.png", AssetType.IMAGE);
		className.set ("assets/images/npc5.png", __ASSET__assets_images_npc5_png);
		type.set ("assets/images/npc5.png", AssetType.IMAGE);
		className.set ("assets/images/npc6.png", __ASSET__assets_images_npc6_png);
		type.set ("assets/images/npc6.png", AssetType.IMAGE);
		className.set ("assets/images/npc7.png", __ASSET__assets_images_npc7_png);
		type.set ("assets/images/npc7.png", AssetType.IMAGE);
		className.set ("assets/images/npc8.png", __ASSET__assets_images_npc8_png);
		type.set ("assets/images/npc8.png", AssetType.IMAGE);
		className.set ("assets/images/npc9.png", __ASSET__assets_images_npc9_png);
		type.set ("assets/images/npc9.png", AssetType.IMAGE);
		className.set ("assets/images/pickupSprite.ase", __ASSET__assets_images_pickupsprite_ase);
		type.set ("assets/images/pickupSprite.ase", AssetType.BINARY);
		className.set ("assets/images/pickupSprite.png", __ASSET__assets_images_pickupsprite_png);
		type.set ("assets/images/pickupSprite.png", AssetType.IMAGE);
		className.set ("assets/images/shelvesOpen.ase", __ASSET__assets_images_shelvesopen_ase);
		type.set ("assets/images/shelvesOpen.ase", AssetType.BINARY);
		className.set ("assets/images/shelvesOpen.png", __ASSET__assets_images_shelvesopen_png);
		type.set ("assets/images/shelvesOpen.png", AssetType.IMAGE);
		className.set ("assets/images/SideShelves.ase", __ASSET__assets_images_sideshelves_ase);
		type.set ("assets/images/SideShelves.ase", AssetType.BINARY);
		className.set ("assets/images/SideShelveSmall.png", __ASSET__assets_images_sideshelvesmall_png);
		type.set ("assets/images/SideShelveSmall.png", AssetType.IMAGE);
		className.set ("assets/images/thumbnailTitle.png", __ASSET__assets_images_thumbnailtitle_png);
		type.set ("assets/images/thumbnailTitle.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/tileset1.png", __ASSET__assets_images_tileset1_png);
		type.set ("assets/images/tileset1.png", AssetType.IMAGE);
		className.set ("assets/images/tileset1resized.png", __ASSET__assets_images_tileset1resized_png);
		type.set ("assets/images/tileset1resized.png", AssetType.IMAGE);
		className.set ("assets/images/titlebg.png", __ASSET__assets_images_titlebg_png);
		type.set ("assets/images/titlebg.png", AssetType.IMAGE);
		className.set ("assets/images/titletype.png", __ASSET__assets_images_titletype_png);
		type.set ("assets/images/titletype.png", AssetType.IMAGE);
		className.set ("assets/images/walkmc.png", __ASSET__assets_images_walkmc_png);
		type.set ("assets/images/walkmc.png", AssetType.IMAGE);
		className.set ("assets/images/walmartRef.png", __ASSET__assets_images_walmartref_png);
		type.set ("assets/images/walmartRef.png", AssetType.IMAGE);
		className.set ("assets/music/558953_Merry-Xmas-Erryone.mp3", __ASSET__assets_music_558953_merry_xmas_erryone_mp3);
		type.set ("assets/music/558953_Merry-Xmas-Erryone.mp3", AssetType.MUSIC);
		className.set ("assets/music/music-goes-here - Copy.txt", __ASSET__assets_music_music_goes_here___copy_txt);
		type.set ("assets/music/music-goes-here - Copy.txt", AssetType.TEXT);
		className.set ("assets/music/musicLisenceStuff.md", __ASSET__assets_music_musiclisencestuff_md);
		type.set ("assets/music/musicLisenceStuff.md", AssetType.TEXT);
		className.set ("assets/music/Wish BackgroundEdited.mp3", __ASSET__assets_music_wish_backgroundedited_mp3);
		type.set ("assets/music/Wish BackgroundEdited.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention1.mp3", __ASSET__assets_sounds_attention1_mp3);
		type.set ("assets/sounds/attention1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention2.mp3", __ASSET__assets_sounds_attention2_mp3);
		type.set ("assets/sounds/attention2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention3.mp3", __ASSET__assets_sounds_attention3_mp3);
		type.set ("assets/sounds/attention3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention4.mp3", __ASSET__assets_sounds_attention4_mp3);
		type.set ("assets/sounds/attention4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention5.mp3", __ASSET__assets_sounds_attention5_mp3);
		type.set ("assets/sounds/attention5.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention6.mp3", __ASSET__assets_sounds_attention6_mp3);
		type.set ("assets/sounds/attention6.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention7.mp3", __ASSET__assets_sounds_attention7_mp3);
		type.set ("assets/sounds/attention7.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/attention8.mp3", __ASSET__assets_sounds_attention8_mp3);
		type.set ("assets/sounds/attention8.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/buttonHangUp.mp3", __ASSET__assets_sounds_buttonhangup_mp3);
		type.set ("assets/sounds/buttonHangUp.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/crowdAmbient.mp3", __ASSET__assets_sounds_crowdambient_mp3);
		type.set ("assets/sounds/crowdAmbient.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pickUpSound.wav", __ASSET__assets_sounds_pickupsound_wav);
		type.set ("assets/sounds/pickUpSound.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/player.tsx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/run debug.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/tileset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/TilesOnly.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/TilesWalmartOnly.tsx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/TilesWalmartV1.tsx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/walmart.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/walmartReal.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/CheckOut.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/CheckOut.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/extras1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/frontShelf.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/LongShelvesSide.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/LongShelvesSide.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/McDonaldssss.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/McDonaldssss.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc11.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/npc9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pickupSprite.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/pickupSprite.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/shelvesOpen.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/shelvesOpen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SideShelves.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/SideShelveSmall.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/thumbnailTitle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tileset1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tileset1resized.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/titlebg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/titletype.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/walkmc.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/walmartRef.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/558953_Merry-Xmas-Erryone.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/music-goes-here - Copy.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/musicLisenceStuff.md";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/Wish BackgroundEdited.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention5.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention6.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention7.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/attention8.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/buttonHangUp.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/crowdAmbient.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pickUpSound.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/player.tsx", __ASSET__assets_data_player_tsx);
		type.set ("assets/data/player.tsx", AssetType.TEXT);
		
		className.set ("assets/data/run debug.txt", __ASSET__assets_data_run_debug_txt);
		type.set ("assets/data/run debug.txt", AssetType.TEXT);
		
		className.set ("assets/data/tileset.png", __ASSET__assets_data_tileset_png);
		type.set ("assets/data/tileset.png", AssetType.IMAGE);
		
		className.set ("assets/data/TilesOnly.png", __ASSET__assets_data_tilesonly_png);
		type.set ("assets/data/TilesOnly.png", AssetType.IMAGE);
		
		className.set ("assets/data/TilesWalmartOnly.tsx", __ASSET__assets_data_tileswalmartonly_tsx);
		type.set ("assets/data/TilesWalmartOnly.tsx", AssetType.TEXT);
		
		className.set ("assets/data/TilesWalmartV1.tsx", __ASSET__assets_data_tileswalmartv1_tsx);
		type.set ("assets/data/TilesWalmartV1.tsx", AssetType.TEXT);
		
		className.set ("assets/data/walmart.tmx", __ASSET__assets_data_walmart_tmx);
		type.set ("assets/data/walmart.tmx", AssetType.TEXT);
		
		className.set ("assets/data/walmartReal.tmx", __ASSET__assets_data_walmartreal_tmx);
		type.set ("assets/data/walmartReal.tmx", AssetType.TEXT);
		
		className.set ("assets/images/CheckOut.ase", __ASSET__assets_images_checkout_ase);
		type.set ("assets/images/CheckOut.ase", AssetType.BINARY);
		
		className.set ("assets/images/CheckOut.png", __ASSET__assets_images_checkout_png);
		type.set ("assets/images/CheckOut.png", AssetType.IMAGE);
		
		className.set ("assets/images/extras1.png", __ASSET__assets_images_extras1_png);
		type.set ("assets/images/extras1.png", AssetType.IMAGE);
		
		className.set ("assets/images/frontShelf.ase", __ASSET__assets_images_frontshelf_ase);
		type.set ("assets/images/frontShelf.ase", AssetType.BINARY);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/LongShelvesSide.ase", __ASSET__assets_images_longshelvesside_ase);
		type.set ("assets/images/LongShelvesSide.ase", AssetType.BINARY);
		
		className.set ("assets/images/LongShelvesSide.png", __ASSET__assets_images_longshelvesside_png);
		type.set ("assets/images/LongShelvesSide.png", AssetType.IMAGE);
		
		className.set ("assets/images/McDonaldssss.ase", __ASSET__assets_images_mcdonaldssss_ase);
		type.set ("assets/images/McDonaldssss.ase", AssetType.BINARY);
		
		className.set ("assets/images/McDonaldssss.png", __ASSET__assets_images_mcdonaldssss_png);
		type.set ("assets/images/McDonaldssss.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc1.png", __ASSET__assets_images_npc1_png);
		type.set ("assets/images/npc1.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc10.png", __ASSET__assets_images_npc10_png);
		type.set ("assets/images/npc10.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc11.png", __ASSET__assets_images_npc11_png);
		type.set ("assets/images/npc11.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc2.png", __ASSET__assets_images_npc2_png);
		type.set ("assets/images/npc2.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc3.png", __ASSET__assets_images_npc3_png);
		type.set ("assets/images/npc3.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc4.png", __ASSET__assets_images_npc4_png);
		type.set ("assets/images/npc4.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc5.png", __ASSET__assets_images_npc5_png);
		type.set ("assets/images/npc5.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc6.png", __ASSET__assets_images_npc6_png);
		type.set ("assets/images/npc6.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc7.png", __ASSET__assets_images_npc7_png);
		type.set ("assets/images/npc7.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc8.png", __ASSET__assets_images_npc8_png);
		type.set ("assets/images/npc8.png", AssetType.IMAGE);
		
		className.set ("assets/images/npc9.png", __ASSET__assets_images_npc9_png);
		type.set ("assets/images/npc9.png", AssetType.IMAGE);
		
		className.set ("assets/images/pickupSprite.ase", __ASSET__assets_images_pickupsprite_ase);
		type.set ("assets/images/pickupSprite.ase", AssetType.BINARY);
		
		className.set ("assets/images/pickupSprite.png", __ASSET__assets_images_pickupsprite_png);
		type.set ("assets/images/pickupSprite.png", AssetType.IMAGE);
		
		className.set ("assets/images/shelvesOpen.ase", __ASSET__assets_images_shelvesopen_ase);
		type.set ("assets/images/shelvesOpen.ase", AssetType.BINARY);
		
		className.set ("assets/images/shelvesOpen.png", __ASSET__assets_images_shelvesopen_png);
		type.set ("assets/images/shelvesOpen.png", AssetType.IMAGE);
		
		className.set ("assets/images/SideShelves.ase", __ASSET__assets_images_sideshelves_ase);
		type.set ("assets/images/SideShelves.ase", AssetType.BINARY);
		
		className.set ("assets/images/SideShelveSmall.png", __ASSET__assets_images_sideshelvesmall_png);
		type.set ("assets/images/SideShelveSmall.png", AssetType.IMAGE);
		
		className.set ("assets/images/thumbnailTitle.png", __ASSET__assets_images_thumbnailtitle_png);
		type.set ("assets/images/thumbnailTitle.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/tileset1.png", __ASSET__assets_images_tileset1_png);
		type.set ("assets/images/tileset1.png", AssetType.IMAGE);
		
		className.set ("assets/images/tileset1resized.png", __ASSET__assets_images_tileset1resized_png);
		type.set ("assets/images/tileset1resized.png", AssetType.IMAGE);
		
		className.set ("assets/images/titlebg.png", __ASSET__assets_images_titlebg_png);
		type.set ("assets/images/titlebg.png", AssetType.IMAGE);
		
		className.set ("assets/images/titletype.png", __ASSET__assets_images_titletype_png);
		type.set ("assets/images/titletype.png", AssetType.IMAGE);
		
		className.set ("assets/images/walkmc.png", __ASSET__assets_images_walkmc_png);
		type.set ("assets/images/walkmc.png", AssetType.IMAGE);
		
		className.set ("assets/images/walmartRef.png", __ASSET__assets_images_walmartref_png);
		type.set ("assets/images/walmartRef.png", AssetType.IMAGE);
		
		className.set ("assets/music/558953_Merry-Xmas-Erryone.mp3", __ASSET__assets_music_558953_merry_xmas_erryone_mp3);
		type.set ("assets/music/558953_Merry-Xmas-Erryone.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/music-goes-here - Copy.txt", __ASSET__assets_music_music_goes_here___copy_txt);
		type.set ("assets/music/music-goes-here - Copy.txt", AssetType.TEXT);
		
		className.set ("assets/music/musicLisenceStuff.md", __ASSET__assets_music_musiclisencestuff_md);
		type.set ("assets/music/musicLisenceStuff.md", AssetType.TEXT);
		
		className.set ("assets/music/Wish BackgroundEdited.mp3", __ASSET__assets_music_wish_backgroundedited_mp3);
		type.set ("assets/music/Wish BackgroundEdited.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention1.mp3", __ASSET__assets_sounds_attention1_mp3);
		type.set ("assets/sounds/attention1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention2.mp3", __ASSET__assets_sounds_attention2_mp3);
		type.set ("assets/sounds/attention2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention3.mp3", __ASSET__assets_sounds_attention3_mp3);
		type.set ("assets/sounds/attention3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention4.mp3", __ASSET__assets_sounds_attention4_mp3);
		type.set ("assets/sounds/attention4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention5.mp3", __ASSET__assets_sounds_attention5_mp3);
		type.set ("assets/sounds/attention5.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention6.mp3", __ASSET__assets_sounds_attention6_mp3);
		type.set ("assets/sounds/attention6.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention7.mp3", __ASSET__assets_sounds_attention7_mp3);
		type.set ("assets/sounds/attention7.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/attention8.mp3", __ASSET__assets_sounds_attention8_mp3);
		type.set ("assets/sounds/attention8.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/buttonHangUp.mp3", __ASSET__assets_sounds_buttonhangup_mp3);
		type.set ("assets/sounds/buttonHangUp.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/crowdAmbient.mp3", __ASSET__assets_sounds_crowdambient_mp3);
		type.set ("assets/sounds/crowdAmbient.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pickUpSound.wav", __ASSET__assets_sounds_pickupsound_wav);
		type.set ("assets/sounds/pickUpSound.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_player_tsx extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_run_debug_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tilesonly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tileswalmartonly_tsx extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tileswalmartv1_tsx extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_walmart_tmx extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_walmartreal_tmx extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_checkout_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_checkout_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_extras1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_frontshelf_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_longshelvesside_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_longshelvesside_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mcdonaldssss_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_mcdonaldssss_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npc9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pickupsprite_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pickupsprite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shelvesopen_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_shelvesopen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sideshelves_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_sideshelvesmall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_thumbnailtitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tileset1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tileset1resized_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_titlebg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_titletype_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_walkmc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_walmartref_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_558953_merry_xmas_erryone_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here___copy_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_musiclisencestuff_md extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_wish_backgroundedited_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention6_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention7_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attention8_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_buttonhangup_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_crowdambient_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pickupsound_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5






























































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/data/player.tsx") #if display private #end class __ASSET__assets_data_player_tsx extends lime.utils.Bytes {}
@:file("assets/data/run debug.txt") #if display private #end class __ASSET__assets_data_run_debug_txt extends lime.utils.Bytes {}
@:image("assets/data/tileset.png") #if display private #end class __ASSET__assets_data_tileset_png extends lime.graphics.Image {}
@:image("assets/data/TilesOnly.png") #if display private #end class __ASSET__assets_data_tilesonly_png extends lime.graphics.Image {}
@:file("assets/data/TilesWalmartOnly.tsx") #if display private #end class __ASSET__assets_data_tileswalmartonly_tsx extends lime.utils.Bytes {}
@:file("assets/data/TilesWalmartV1.tsx") #if display private #end class __ASSET__assets_data_tileswalmartv1_tsx extends lime.utils.Bytes {}
@:file("assets/data/walmart.tmx") #if display private #end class __ASSET__assets_data_walmart_tmx extends lime.utils.Bytes {}
@:file("assets/data/walmartReal.tmx") #if display private #end class __ASSET__assets_data_walmartreal_tmx extends lime.utils.Bytes {}
@:file("assets/images/CheckOut.ase") #if display private #end class __ASSET__assets_images_checkout_ase extends lime.utils.Bytes {}
@:image("assets/images/CheckOut.png") #if display private #end class __ASSET__assets_images_checkout_png extends lime.graphics.Image {}
@:image("assets/images/extras1.png") #if display private #end class __ASSET__assets_images_extras1_png extends lime.graphics.Image {}
@:file("assets/images/frontShelf.ase") #if display private #end class __ASSET__assets_images_frontshelf_ase extends lime.utils.Bytes {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:file("assets/images/LongShelvesSide.ase") #if display private #end class __ASSET__assets_images_longshelvesside_ase extends lime.utils.Bytes {}
@:image("assets/images/LongShelvesSide.png") #if display private #end class __ASSET__assets_images_longshelvesside_png extends lime.graphics.Image {}
@:file("assets/images/McDonaldssss.ase") #if display private #end class __ASSET__assets_images_mcdonaldssss_ase extends lime.utils.Bytes {}
@:image("assets/images/McDonaldssss.png") #if display private #end class __ASSET__assets_images_mcdonaldssss_png extends lime.graphics.Image {}
@:image("assets/images/npc1.png") #if display private #end class __ASSET__assets_images_npc1_png extends lime.graphics.Image {}
@:image("assets/images/npc10.png") #if display private #end class __ASSET__assets_images_npc10_png extends lime.graphics.Image {}
@:image("assets/images/npc11.png") #if display private #end class __ASSET__assets_images_npc11_png extends lime.graphics.Image {}
@:image("assets/images/npc2.png") #if display private #end class __ASSET__assets_images_npc2_png extends lime.graphics.Image {}
@:image("assets/images/npc3.png") #if display private #end class __ASSET__assets_images_npc3_png extends lime.graphics.Image {}
@:image("assets/images/npc4.png") #if display private #end class __ASSET__assets_images_npc4_png extends lime.graphics.Image {}
@:image("assets/images/npc5.png") #if display private #end class __ASSET__assets_images_npc5_png extends lime.graphics.Image {}
@:image("assets/images/npc6.png") #if display private #end class __ASSET__assets_images_npc6_png extends lime.graphics.Image {}
@:image("assets/images/npc7.png") #if display private #end class __ASSET__assets_images_npc7_png extends lime.graphics.Image {}
@:image("assets/images/npc8.png") #if display private #end class __ASSET__assets_images_npc8_png extends lime.graphics.Image {}
@:image("assets/images/npc9.png") #if display private #end class __ASSET__assets_images_npc9_png extends lime.graphics.Image {}
@:file("assets/images/pickupSprite.ase") #if display private #end class __ASSET__assets_images_pickupsprite_ase extends lime.utils.Bytes {}
@:image("assets/images/pickupSprite.png") #if display private #end class __ASSET__assets_images_pickupsprite_png extends lime.graphics.Image {}
@:file("assets/images/shelvesOpen.ase") #if display private #end class __ASSET__assets_images_shelvesopen_ase extends lime.utils.Bytes {}
@:image("assets/images/shelvesOpen.png") #if display private #end class __ASSET__assets_images_shelvesopen_png extends lime.graphics.Image {}
@:file("assets/images/SideShelves.ase") #if display private #end class __ASSET__assets_images_sideshelves_ase extends lime.utils.Bytes {}
@:image("assets/images/SideShelveSmall.png") #if display private #end class __ASSET__assets_images_sideshelvesmall_png extends lime.graphics.Image {}
@:image("assets/images/thumbnailTitle.png") #if display private #end class __ASSET__assets_images_thumbnailtitle_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/tileset1.png") #if display private #end class __ASSET__assets_images_tileset1_png extends lime.graphics.Image {}
@:image("assets/images/tileset1resized.png") #if display private #end class __ASSET__assets_images_tileset1resized_png extends lime.graphics.Image {}
@:image("assets/images/titlebg.png") #if display private #end class __ASSET__assets_images_titlebg_png extends lime.graphics.Image {}
@:image("assets/images/titletype.png") #if display private #end class __ASSET__assets_images_titletype_png extends lime.graphics.Image {}
@:image("assets/images/walkmc.png") #if display private #end class __ASSET__assets_images_walkmc_png extends lime.graphics.Image {}
@:image("assets/images/walmartRef.png") #if display private #end class __ASSET__assets_images_walmartref_png extends lime.graphics.Image {}
@:file("assets/music/558953_Merry-Xmas-Erryone.mp3") #if display private #end class __ASSET__assets_music_558953_merry_xmas_erryone_mp3 extends lime.utils.Bytes {}
@:file("assets/music/music-goes-here - Copy.txt") #if display private #end class __ASSET__assets_music_music_goes_here___copy_txt extends lime.utils.Bytes {}
@:file("assets/music/musicLisenceStuff.md") #if display private #end class __ASSET__assets_music_musiclisencestuff_md extends lime.utils.Bytes {}
@:file("assets/music/Wish BackgroundEdited.mp3") #if display private #end class __ASSET__assets_music_wish_backgroundedited_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention1.mp3") #if display private #end class __ASSET__assets_sounds_attention1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention2.mp3") #if display private #end class __ASSET__assets_sounds_attention2_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention3.mp3") #if display private #end class __ASSET__assets_sounds_attention3_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention4.mp3") #if display private #end class __ASSET__assets_sounds_attention4_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention5.mp3") #if display private #end class __ASSET__assets_sounds_attention5_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention6.mp3") #if display private #end class __ASSET__assets_sounds_attention6_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention7.mp3") #if display private #end class __ASSET__assets_sounds_attention7_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/attention8.mp3") #if display private #end class __ASSET__assets_sounds_attention8_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/buttonHangUp.mp3") #if display private #end class __ASSET__assets_sounds_buttonhangup_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/crowdAmbient.mp3") #if display private #end class __ASSET__assets_sounds_crowdambient_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/pickUpSound.wav") #if display private #end class __ASSET__assets_sounds_pickupsound_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end