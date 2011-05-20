package cmodule.shine;

extern class StaticInitter {
	var ascii(null,default) : Void;
	var asciz(null,default) : Void;
	var i16(null,default) : Void;
	var i32(null,default) : Void;
	var i8(null,default) : Void;
	var zero(null,default) : Void;
	function new() : Void;
	function alloc(p0 : Int, p1 : Int) : Int;
	function start(p0 : Int) : Void;
}
