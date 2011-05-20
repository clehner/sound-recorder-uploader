package cmodule.shine;

extern class CAllocedValueTypemap extends CTypemap {
	function new(p0 : ICAllocator) : Void;
	private function alloc(p0 : Dynamic) : Int;
	private function free(p0 : Int) : Void;
}
