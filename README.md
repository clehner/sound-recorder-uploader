# Flash (haxe) MP3 Recorder & Uploader

This is a flash thingy that lets you make recordings in the browser from the microphone, and upload them directly to a web server as an mp3. It is coded with haxe so you do not need the Flash IDE to edit the code.

## Compiling

    haxe compile.hxml

## Usage

* In the same directory, put `shineMP3_alchemy.swf`, `recorder.swf`, `upload_mp3.php`, and an empty directory called `recordings`.
* Make sure the `recordings` directory is writable by the web server.
* Embed `recorder.swf` in a page (e.g. index.html)

## License

**sound-recorder-uploader** is copyright © 2013 Charles Lehner, and released under the terms of the [MIT License](http://cel.mit-license.org/).

**sound-recorder-uploader** uses the [Flash/Alchemy port of the lightweight Shine MP3 Encoder](https://github.com/kikko/Shine-MP3-Encoder-on-AS3-Alchemy), by [Cyril Diagne](http://kikko.fr/).
