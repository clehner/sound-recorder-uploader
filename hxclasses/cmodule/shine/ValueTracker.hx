package cmodule.shine;

extern class ValueTracker {
	function new() : Void;
	function acquire(p0 : Dynamic) : Int;
	function acquireId(p0 : Int) : Int;
	function get(p0 : Int) : Dynamic;
	function release(p0 : Int) : Dynamic;
}
