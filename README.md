# Flash (haxe) MP3 Recorder & Uploader

This is a flash thingy that lets you make recordings in the browser from the microphone, and upload them directly to a web server as an mp3. It is coded with haxe so you do not need the Flash IDE to edit the code.

## Compiling

    haxe compile.hxml

## Usage

* In the same directory, put `shineMP3_alchemy.swf`, `recorder.swf`, `upload_mp3.php`, and an empty directory called `recordings`.
* Make sure the `recordings` directory is writable by the web server.
* Embed `recorder.swf` in a page (e.g. index.html)
