package;

import php.Lib;
import php.Web;
import sys.FileSystem;
import sys.io.File;

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

	static function main()
	{
		var m = new Main(2);
	}
	public function new(parentLevel:Int)
	{
		_parentLevel = parentLevel;
		params = Web.getParams();
		dir = Web.getCwd();
		listMatchingFiles();
	}
	function listMatchingFiles()
	{
		var script = "";
		var dirPathTab = dir.split("/");
		var rootPath = dirPathTab.slice(0, dirPathTab.length -3);
		var debug:Bool = params.exists("debug")? params.get("debug")=="true": false;
		//Lib.print(debug);
		/*if (params.exists("parentlevel"))
		{
			_parentLevel = Std.parseInt(params.get("parentlevel"));
		}*/

		//Lib.print(dirPathTab);
		//dirPathTab.splice( dirPathTab.length - 1 - _parentLevel, _parentLevel);
		//Lib.print(dirPathTab);

		//var last = dirPathTab[dirPathTab.length - _parentLevel];
		if (params.exists("scriptfile"))
		{
			script = params.get("scriptfile");
			rootPath.push(script);
		}
		else
		{
			Lib.print("scriptfile is unknown");
			return;
		}

		//Lib.print("Main::listMatchingFiles::last", last );
		var reg:EReg = new EReg('^${script}_(\\d{8}_\\d{6})(.min)?.js$', "i");
		var regTest:EReg = new EReg('^(${script})(.min)?.js$', "i");
		var appDir = rootPath.join("/");

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
						Lib.print("0");
						//Lib.print("matched debug");
						return;
					}
				}
			}
			else
			{
				for (i in files)
				{
					if (reg.match(i))
					{
						Lib.print(reg.matched(1));
						//Lib.print("matched min");
						return;
					}
				}
			}
		}
		else
		{
			Lib.print(appDir + " not exists");
		}

		Lib.print("-1");

		return;
	}

}