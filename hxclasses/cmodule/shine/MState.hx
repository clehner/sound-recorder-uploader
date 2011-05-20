package cmodule.shine;

extern class MState extends MemUser {
	var cf : UInt;
	var ds : flash.utils.ByteArray;
	var eax : Int;
	var ebp : Int;
	var edx : Int;
	var esp : Int;
	var funcs : flash.Vector<Dynamic>;
	var gworker : Machine;
	var st0 : Float;
	var syms : Dynamic;
	var system : CSystem;
	function new(p0 : Machine) : Void;
	function copyTo(p0 : MState) : Void;
	function pop() : Int;
	function push(p0 : Int) : Void;
}
