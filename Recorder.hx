import StringTools;

import flash.display.MovieClip;
import flash.display.Sprite;

import flash.text.TextFormat;
import flash.text.TextField;
import flash.text.TextFieldType;

import flash.utils.ByteArray;
import flash.utils.Timer;
import flash.media.Microphone;
import flash.media.Sound;
import flash.media.SoundTransform;
import flash.errors.Error;

import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLLoader;

import flash.events.Event;
import flash.events.SampleDataEvent;
import flash.events.ProgressEvent;
import flash.events.ErrorEvent;
import flash.events.TimerEvent;
import flash.events.SecurityErrorEvent;
import flash.events.IOErrorEvent;

import fr.kikko.lab.ShineMP3Encoder;
import WAVWriter;
import ControlButton;

class Recorder {
	private static var soundBytes:ByteArray;
	private static var mymic:Microphone;
	private static var mySound:Sound;
	private static var micTimer:Timer;
	private static var recorded:Bool;
	private static var mp3Encoder:ShineMP3Encoder;
	private static var loader:URLLoader;
	private static var recordingName:String;
	
	private static var recBtn:Sprite;
	private static var stopBtn:Sprite;
	private static var playBtn:Sprite;
	private static var saveBtn:Sprite;
	private static var progressBar:Sprite;
	private static var statusText:TextField;
	private static var nameText:TextField;
	private static var nameTextContainer:Sprite;
	
    public static function main() {
		// Load stuff dynamically because statically didn't work.
		// http://haxe.1354130.n2.nabble.com/Error-importing-swf-file-containing-Alchemy-code-td5352270.html
		
		var req = new URLRequest(getBaseURL() + "shineMP3_alchemy.swf");
		var domain = flash.system.ApplicationDomain.currentDomain;
		var ctx = new flash.system.LoaderContext(false, domain);
		var loader = new flash.display.Loader();
		loader.load(req, ctx);
		
		// Make buttons
		var mc : MovieClip = flash.Lib.current;

		recBtn = new ControlButton("record", startRecord, 20, 20);
		mc.addChild(recBtn);
		
		stopBtn = new ControlButton("stop", doStop, 90, 20);
		mc.addChild(stopBtn);
		
		playBtn = new ControlButton("play", doPlay, 160, 20);
		mc.addChild(playBtn);
		
		saveBtn = new ControlButton("save", doSave, 230, 20);
		mc.addChild(saveBtn);
		
		// Make progress bar
		var progressBarContainer = new Sprite();
		var g = progressBarContainer.graphics;
		g.beginFill(0xffffff); //start off with black
		g.drawRect(0, 0, 260, 24);
		mc.addChild(progressBarContainer);
		progressBarContainer.x = 20;
		progressBarContainer.y = 102;
		
		progressBar = new Sprite();
		g = progressBar.graphics;
		g.beginFill(0x999999); //start off with black
		g.drawRect(0, 0, 256, 20);
		progressBarContainer.addChild(progressBar);
		progressBar.x = 2;
		progressBar.y = 2;
		
		// Status text
		statusText = new TextField();
		var tf = new TextFormat();
		tf.font = "Helvetica";
		tf.color = 0xcccccc;
		tf.size = 14;
		statusText.defaultTextFormat = tf;
		statusText.x = 20;
		statusText.y = 132;
		statusText.width = 260;
		mc.addChild(statusText);
		
		// Name text field
		nameText = new TextField();
		nameText.type = TextFieldType.INPUT;
		nameText.width = 210;
		nameText.x = 1;
		nameText.y = 1;
		var nameTF = new TextFormat();
		nameTF.font = "Helvetica";
		nameTF.color = 0xbbbbbb;
		nameTF.size = 13;
		nameText.defaultTextFormat = nameTF;

		nameTextContainer = new Sprite();
		nameTextContainer.addChild(nameText);
		mc.addChild(nameTextContainer);
		g = nameTextContainer.graphics;
		g.lineStyle(2, 0x666666);
		g.drawRect(0, 0, 210, 20);
		nameTextContainer.x = 20;
		nameTextContainer.y = 156;
		nameTextContainer.visible = false;
		
		var saveNameBtn = new ControlButton("save name", reallySave, 212, 0);
		nameTextContainer.addChild(saveNameBtn);
		
		setStatus("Ready");
		
		soundBytes = new ByteArray();
       
		// Get Microphone
		mymic = Microphone.getMicrophone();
		
		mymic.rate = 44;
		mymic.setSilenceLevel(0);
		
		mymic.setUseEchoSuppression(false);
		mymic.soundTransform = new SoundTransform(0, 0);
		mymic.setLoopBack(true);
		
		micTimer = new Timer(100);
		micTimer.addEventListener(TimerEvent.TIMER, miclevel);
		micTimer.start();
		
		recorded = false;
    }
    
	private static function getBaseURL() : String {
		var stage = flash.Lib.current.stage;
		var ldrURL:Array<String> = stage.loaderInfo.url.split("/");
		ldrURL.pop();
		var base:String = ldrURL.join("/")+"/";
		return base;
	}
	
    private static function setStatus(status:String) {
    	statusText.text = status;
    }
  
	private static function startRecord(e:Event) {
		soundBytes.clear();
		mymic.addEventListener(SampleDataEvent.SAMPLE_DATA, micSampleDataHandler);
		setStatus("Recording");
		recorded = true;
	}
	private static function micSampleDataHandler(event:SampleDataEvent) {
		while (event.data.bytesAvailable != 0) {
			var sample:Float = event.data.readFloat();
			soundBytes.writeFloat(sample);
		}
	}
	private static function playbackSampleHandler(event:SampleDataEvent) {
		for (i in 0...8192) {
			if (soundBytes.bytesAvailable == 0) break;
			var sample:Float = soundBytes.readFloat();
			event.data.writeFloat(sample);
			event.data.writeFloat(sample);
		}
	}
	
	private static function doStop(e:Event) {
		mymic.removeEventListener(SampleDataEvent.SAMPLE_DATA, micSampleDataHandler);
		setStatus("Stopped recording");
	}
	
	private static function doPlay(e:Event) {
		soundBytes.position = 0;
		mySound = new Sound();
		mySound.addEventListener(SampleDataEvent.SAMPLE_DATA, playbackSampleHandler);
		mySound.play();
		setStatus("Playing");
	}
	
	private static function miclevel(event:TimerEvent) {
		progressBar.width = mymic.activityLevel * 2.56;
	}
	
	private static function doSave(e:Event) {
		if (!recorded) {
			setStatus("Make a recording first.");
			return;
		}
		
		setStatus("Title your song (only you will see this):");
		nameTextContainer.visible = true;
	}
	
	private static function reallySave(e:Event) {
		recordingName = nameText.text;
		if (recordingName == "") {
			return;
		}
		nameTextContainer.visible = false;
		setStatus("Saving");
		
		// encode to WAV
		var wavWriter:WAVWriter = new WAVWriter();
		wavWriter.writeSamples(soundBytes);
		var wavData:ByteArray = wavWriter.getWAV();
		
		// encode to MP3
		mp3Encoder = new ShineMP3Encoder(wavData);
		mp3Encoder.addEventListener(ProgressEvent.PROGRESS, mp3EncodeProgress);
		mp3Encoder.addEventListener(ErrorEvent.ERROR, mp3EncodeError);
		mp3Encoder.addEventListener(Event.COMPLETE, mp3EncodeComplete);
		mp3Encoder.start();
	}
	
	private static function mp3EncodeProgress(event : ProgressEvent) {
		//trace(event.bytesLoaded, event.bytesTotal);
		var progress = event.bytesLoaded / event.bytesTotal * 100;
		setStatus("Encoding MP3... " + progress + "%");
	}
	
	private static function mp3EncodeError(event : ErrorEvent) {
		setStatus("Error : " + event.text);
	}
	
	private static function mp3EncodeComplete(event : Event) {
		//trace("Done encoding !", mp3Encoder.mp3Data.length);
		mp3Encoder.wavData.clear();
		uploadMP3();
	}
	
	private static function uploadMP3() {
		setStatus("Uploading");
		loader = new URLLoader();
		var url = getBaseURL() + "upload_mp3.php";
		var query = "name=" + StringTools.urlEncode(recordingName);
		var request : URLRequest = new URLRequest(url + "?" + query);
		
		// PUT requires flash 10.1.
		request.method = URLRequestMethod.POST;
		request.data = mp3Encoder.mp3Data;
		request.contentType = "application/octet-stream";
		
		// Handlers
		loader.addEventListener(Event.COMPLETE, uploadComplete);
		loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, uploadError);
		loader.addEventListener(IOErrorEvent.IO_ERROR, uploadError);
		try {
			loader.load(request);
		} catch (error : Dynamic) {
			setStatus("Upload error. " + error);
		}
	}
	
	private static function uploadError(event:Event) {
		setStatus("Upload error. " + event);
	}
	
	private static function uploadComplete(event:Event) {
		trace("Upload complete.");
		var data = loader.data;
		trace(data);
		if (data == "") {
			setStatus("There was a problem. Check your login.");
		} else {
			setStatus("Your recording is published!");
		}
		// reset
		mp3Encoder.mp3Data.clear();
	}
}

