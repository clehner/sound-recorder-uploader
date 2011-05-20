package cmodule.shine;

extern class CBuffer {
	var ptr(default,null) : Int;
	var size(default,null) : Int;
	var value : Dynamic;
	function new(p0 : Int, ?p1 : ICAllocator) : Void;
	function free() : Void;
	function reset() : Void;
	private function computeValue() : Dynamic;
	private function setValue(p0 : Dynamic) : Void;
	static function free(p0 : Int) : Void;
}
