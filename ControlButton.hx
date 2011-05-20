import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Graphics;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.events.MouseEvent;

class ControlButton extends Sprite {
	private var g:Graphics;
	private var textFormat:TextFormat;
	private var label:TextField;
	
	public function new(name, onClick, x, y) {
		super();
		this.x = x;
		this.y = y;
		g = graphics;
		buttonMode = true;
		
		alpha = 0.75;
		
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		
		label = new TextField();
		label.text = name;
		textFormat = new TextFormat();
		textFormat.font = "Helvetica";
		textFormat.color = 0xffffff;
		textFormat.size = 18;
		textFormat.align = flash.text.TextFormatAlign.CENTER;
		label.setTextFormat(textFormat);
		label.x = -24;
		label.y = 52;
		addChild(label);
		
		if (name == "save name") {
			drawSaveName();
			return;
		}
		
		// Draw rounded rectangle
		g.lineStyle(2, 0xe5e5e5);
		g.beginFill(0xffffff);
		g.drawRoundRect(0,0,48,48,16,16);
		g.endFill();
		g.lineStyle(0, 0);
		
		switch (name) {
			case "play": drawPlay();
			case "stop": drawStop();
			case "record": drawRecord();
			case "save": drawSave();
		}
	}
	
	private function drawPlay() {
		g.beginFill(0x333333);
		g.moveTo(14, 10);
		g.lineTo(39, 24);
		g.lineTo(14, 38);
		g.endFill();
	}
	
	private function drawStop() {
		g.beginFill(0x333333);
		g.drawRect(13, 13, 22, 22);
		g.endFill();
	}
	
	private function drawRecord() {
		g.beginFill(0x333333);
		g.drawCircle(24, 24, 12);
		g.endFill();
	}
	
	private function drawSave() {
		// [[66,12],[108,54],[78,54],[78,102],[18,102],[18,78],[54,78],[54,54],[24,54]]
		g.beginFill(0x333333);
		g.moveTo(26, 5);
		g.lineTo(42, 21);
		g.lineTo(30, 21);
		g.lineTo(30, 39);
		g.lineTo(7, 39);
		g.lineTo(7, 30);
		g.lineTo(21, 30);
		g.lineTo(21, 21);
		g.lineTo(9, 21);
		g.endFill();
	}
	
	private function drawSaveName() {
		// Draw rounded rectangle
		g.lineStyle(2, 0xe5e5e5);
		g.beginFill(0xffffff);
		g.drawRoundRect(8,1,40,18,16,16);
		g.endFill();
		g.lineStyle(0, 0);
		
		label.y = 2;
		label.x = -22;
		textFormat.size = 14;
		textFormat.color = 0x333333;
		label.text = "save";
		label.setTextFormat(textFormat);
	}
	
	private function onMouseOver(e) {
		alpha = 1;
	}
	
	private function onMouseOut(e) {
		alpha = .75;
	}
	
	private function onMouseDown(e) {
		alpha = .5;
	}
	
	private function onMouseUp(e) {
		alpha = .75;
	}
}