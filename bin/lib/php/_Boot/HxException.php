<?php
/**
 * Generated by Haxe 4.0.5
 */

namespace php\_Boot;

use \php\Boot;

/**
 * Special exception which is used to wrap non-throwable values
 */
class HxException extends \Exception {
	/**
	 * @var mixed
	 */
	public $e;

	/**
	 * @param mixed $e
	 * 
	 * @return void
	 */
	public function __construct ($e) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:1023: characters 3-13
		$this->e = $e;
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:1024: characters 3-27
		parent::__construct(Boot::stringify($e));
	}
}

Boot::registerClass(HxException::class, 'php._Boot.HxException');
