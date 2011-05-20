package cmodule.shine;

extern class CStrUTF8Typemap extends CAllocedValueTypemap {
	function new(?p0 : ICAllocator) : Void;
	private function ByteArrayForString(p0 : String) : flash.utils.ByteArray;
}
