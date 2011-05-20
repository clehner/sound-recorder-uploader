package cmodule.shine;

extern class CRunner implements Debuggee {
	var isRunning(default,null) : Bool;
	function new(?p0 : Bool) : Void;
	function cancelDebug() : Void;
	function createArgv(p0 : Array<Dynamic>) : Array<Dynamic>;
	function createEnv(p0 : Dynamic) : Array<Dynamic>;
	function rawAllocIntArray(p0 : Array<Dynamic>) : Int;
	function rawAllocString(p0 : String) : Int;
	function rawAllocStringArray(p0 : Array<Dynamic>) : Array<Dynamic>;
	function resume() : Void;
	function startInit() : Void;
	function startSystem() : Void;
	function startSystemBridge(p0 : String, p1 : Int) : Void;
	function startSystemLocal(?p0 : Bool) : Void;
	function suspend() : Void;
	function work() : Void;
}
