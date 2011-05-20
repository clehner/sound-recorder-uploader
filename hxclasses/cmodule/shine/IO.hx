package cmodule.shine;

extern class IO {
	var position : Int;
	var size : Int;
	function new() : Void;
	function close() : Int;
	function read(p0 : Int, p1 : Int) : Int;
	function write(p0 : Int, p1 : Int) : Int;
}
