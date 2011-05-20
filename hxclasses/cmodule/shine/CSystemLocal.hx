package cmodule.shine;

extern class CSystemLocal implements CSystem {
	function new(?p0 : Bool) : Void;
	function access(p0 : Int, p1 : Int) : Int;
	function close(p0 : Int) : Int;
	function exit(p0 : Int) : Void;
	function fsize(p0 : Int) : Int;
	function getargv() : Array<Dynamic>;
	function getenv() : Dynamic;
	function ioctl(p0 : Int, p1 : Int, p2 : Int) : Int;
	function lseek(p0 : Int, p1 : Int, p2 : Int) : Int;
	function open(p0 : Int, p1 : Int, p2 : Int) : Int;
	function psize(p0 : Int) : Int;
	function read(p0 : Int, p1 : Int, p2 : Int) : Int;
	function setup(p0 : Dynamic) : Void;
	function tell(p0 : Int) : Int;
	function write(p0 : Int, p1 : Int, p2 : Int) : Int;
}
