<?php
/**
 * Generated by Haxe 4.3.0
 * Haxe source file: C:\HaxeToolkit\haxe\std/php/Boot.hx
 */

namespace php\_Boot;

use \php\Boot;

/**
 * Anonymous objects implementation
 */
class HxAnon extends \StdClass {
	/**
	 * @param array $fields
	 * 
	 * @return void
	 */
	public function __construct ($fields = null) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:949: lines 949-954
		$_gthis = $this;
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:950: characters 3-10
		;
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:951: lines 951-953
		if ($fields !== null) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:952: characters 4-84
			foreach ($fields as $key => $value) {
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:952: characters 65-69
				$tmp = $_gthis;
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:952: characters 49-83
				$tmp->{$key} = $value;
			}
		}
	}

	/**
	 * @param string $name
	 * @param array $args
	 * 
	 * @return mixed
	 */
	public function __call ($name, $args) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:963: characters 3-57
		return ($this->$name)(...$args);
	}

	/**
	 * @param string $name
	 * 
	 * @return mixed
	 */
	public function __get ($name) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:958: characters 3-14
		return null;
	}
}

Boot::registerClass(HxAnon::class, 'php._Boot.HxAnon');
