package;

import haxe.Json;
import php.Lib;
import php.Web;
import sys.FileSystem;
import sys.io.File;
import version.Params;

/**
 * Simple script to retrun the lateste version of the no intenet js script
 * @author bb
 */
class Main
{
	var reg:EReg;
	var _parentLevel:Int;
	var dir:String;
	var params:haxe.ds.Map<String, String>;
	var script:String;
	var rootPath;
	var debug:Bool;
	var appDir;

	static function main()
	{
		var m = new Main(2);
	}
	public function new(parentLevel:Int)
	{
		_parentLevel = parentLevel;
		params = Web.getParams();
		dir = Web.getCwd();
		var dirPathTab = dir.split("/");
        script = "";
		debug = params.exists(DEBUG)? params.get(Params.DEBUG)=="true": false;

		if (params.exists(Params.SCRIPT_FILE))
		{
			rootPath = dirPathTab.slice(0, dirPathTab.length -3);
			script = params.get(Params.SCRIPT_FILE);
			rootPath.push(script);
			appDir = rootPath.join("/");
			if (!params.exists(Params.ASSETS_VERSION)){
				// legacy version tracker
				Lib.print(listMatchingFiles());
			}else{
				var scriptVersion = listMatchingFiles();
				var assetsVersion = getCurrentAssetVersion();
				Lib.print(
					Json.stringify({
						scriptVersion : scriptVersion,
						assetsVersion : assetsVersion
					}));
			}
		}
		else
		{
			Lib.print("scriptfile is unknown");
			
		}
		return;
	}
	
	function getCurrentAssetVersion() 
	{
		var configPath = appDir + "/assets/data/dev_config.json";
		if (FileSystem.exists(configPath))
		{
			 var configFile:Dynamic = Json.parse( File.getContent(configPath) );
			 return configFile.assetsVersion;
		}
		else return "-1";
	}
	function listMatchingFiles()
	{
		var reg:EReg = new EReg('^${script}_(\\d{8}_\\d{6})(.min)?.js$', "i");
		var regTest:EReg = new EReg('^(${script})(.min)?.js$', "i");
		

		if (FileSystem.exists(appDir))
		{
			//Lib.print(appDir);
			var files = FileSystem.readDirectory(appDir);
			//Lib.print(files.length);

			if (debug)
			{
				for (i in files)
				{
					if (regTest.match(i))
					{
						return "0";
					}
				}
			}
			else
			{
				for (i in files)
				{
					if (reg.match(i))
					{
						return reg.matched(1);
					}
				}
			}
		}
		else
		{
			return appDir + " not exists";
		}
		// if app directory exists but no file found that matches the regex
		return "-1";
	}

}