package cmodule.shine;

extern class CTypemap {
	var ptrLevel(default,null) : Int;
	var typeSize(default,null) : Int;
	function new() : Void;
	function createC(p0 : Dynamic, ?p1 : Int) : Array<Dynamic>;
	function destroyC(p0 : Array<Dynamic>) : Void;
	function fromC(p0 : Array<Dynamic>) : Dynamic;
	function fromReturnRegs(p0 : Dynamic) : Dynamic;
	function getValueSize(p0 : Dynamic) : Int;
	function readValue(p0 : Int) : Dynamic;
	function toReturnRegs(p0 : Dynamic, p1 : Dynamic, ?p2 : Int) : Void;
	function writeValue(p0 : Int, p1 : Dynamic) : Void;
	static var AS3ValType : CAS3ValTypemap;
	static var BufferType : CBufferTypemap;
	static var DoubleRefType : CRefTypemap;
	static var DoubleType : CDoubleTypemap;
	static var IntRefType : CRefTypemap;
	static var IntType : CIntTypemap;
	static var PtrType : CPtrTypemap;
	static var SizedStrType : CSizedStrUTF8Typemap;
	static var StrRefType : CRefTypemap;
	static var StrType : CStrUTF8Typemap;
	static var VoidType : CVoidTypemap;
	static function getTypeByName(p0 : String) : CTypemap;
	static function getTypesByNameArray(p0 : Array<Dynamic>) : Array<Dynamic>;
	static function getTypesByNames(p0 : String) : Array<Dynamic>;
}
