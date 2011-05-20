package cmodule.shine;

extern class CHeapAllocator implements ICAllocator {
	function new() : Void;
	function alloc(p0 : Int) : Int;
	function free(p0 : Int) : Void;
}
