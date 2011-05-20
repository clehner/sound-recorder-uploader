package cmodule.shine;

extern interface Debuggee {
	var isRunning(default,null) : Bool;
	function cancelDebug() : Void;
	function resume() : Void;
	function suspend() : Void;
}
