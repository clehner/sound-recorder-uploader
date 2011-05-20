package cmodule.shine;

extern class Machine extends MemUser {
	var caller : Machine;
	var dbgDepth(default,null) : Int;
	var dbgFileId : Int;
	var dbgFileName(default,null) : String;
	var dbgFuncId(default,null) : Int;
	var dbgFuncName(default,null) : String;
	var dbgLabel : Int;
	var dbgLineNo : Int;
	var dbgLoc(default,null) : Dynamic;
	var dbgTrace(default,null) : String;
	var mstate : MState;
	var state : Int;
	function new() : Void;
	function backtrace() : Void;
	function debugBreak(p0 : Dynamic) : Void;
	function debugLabel(p0 : Int) : Void;
	function debugLoc(p0 : Int, p1 : Int) : Void;
	function debugTraceMem(p0 : Int, p1 : Int) : Void;
	function debugTraverseCurrentScope(p0 : Dynamic) : Void;
	function getSecsSetMS() : UInt;
	function stringFromPtr(p0 : Int) : String;
	function stringToPtr(p0 : Int, p1 : Int, p2 : String) : Int;
	function work() : Void;
	static var dbgBreakpoints : Dynamic;
	static var dbgFileNames : Array<Dynamic>;
	static var dbgFrameBreakHigh : Int;
	static var dbgFrameBreakLow : Int;
	static var dbgFuncNames : Array<Dynamic>;
	static var dbgFuncs : Array<Dynamic>;
	static var dbgGlobals : Array<Dynamic>;
	static var dbgLabels : Array<Dynamic>;
	static var dbgLocs : Array<Dynamic>;
	static var dbgScopes : Array<Dynamic>;
	static var sMS : UInt;
	static function debugTraverseScope(p0 : Dynamic, p1 : Int, p2 : Dynamic) : Void;
}
