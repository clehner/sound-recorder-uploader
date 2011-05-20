package fr.kikko.lab;

import flash.events.ProgressEvent;
import cmodule.shine.CLibInit;

import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.net.FileReference;
import flash.utils.ByteArray;
import flash.utils.Timer;

/**
 * @author kikko.fr - 2010
 */
class ShineMP3Encoder extends EventDispatcher {
	
	public var wavData:ByteArray;
	public var mp3Data:ByteArray;
	
	private var cshine:Dynamic;
	private var timer:Timer;
	private var initTime:Int;
	
	public function new(wavData:ByteArray) {
		super();
		this.wavData = wavData;
	}

	public function start() {
		
		initTime = flash.Lib.getTimer();
		
		mp3Data = new ByteArray();
		
		timer = new Timer(1000/30);
		timer.addEventListener(TimerEvent.TIMER, update);
		
		cshine = new CLibInit().init();
		cshine.init(this, wavData, mp3Data);
		
		if(timer != null) timer.start();
	}
	
	public function shineError(message:String) {
		
		timer.stop();
		timer.removeEventListener(TimerEvent.TIMER, update);
		timer = null;
		
		dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, message));
	}
	
	public function saveAs(filename:String=".mp3") {
		
		new FileReference().save(mp3Data, filename);
	}
	
	private function update(event : TimerEvent) {
		
		var percent:Int = cshine.update();
		dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, percent, 100));
		
		trace("encoding mp3...", percent+"%");
		
		if(percent==100) {
			
			trace("Done in", (flash.Lib.getTimer()-initTime) * 0.001 + "s");
			
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, update);
			timer = null;
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}