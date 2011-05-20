package cmodule.shine;

extern interface ICAllocator {
	function alloc(p0 : Int) : Int;
	function free(p0 : Int) : Void;
}
