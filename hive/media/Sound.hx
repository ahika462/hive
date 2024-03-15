package hive.media;

import hive.backend.SoundBackend;
import hxd.res.Sound as Source;
import hive.math.Point;
import hive.time.Timeline;
import hxd.snd.Channel;

@:allow(hive)
class Sound implements IHived {
	var game:Game;

	var source:Source;
	var channel:Channel;

	public var timeline(default, null):Timeline;
	public var position(default, null):Point;

	public var paused(get, set):Bool;
	inline function get_paused():Bool {
		return channel != null ? channel.pause : false;
	}
	inline function set_paused(value:Bool):Bool {
		return channel != null ? channel.pause = value : value;
	}

	public function new(?list:SoundBackend) {
		timeline = new Timeline();
		position = new Point();
		
		if (list != null)
			list.add(this);
	}

	public function load(source:Source):Sound {
		this.source = source;
		return this;
	}

	public function play(volume:Float = 1, loop:Bool = false):Sound {
		channel = source.play(loop, volume);
		timeline = new Timeline(channel.duration, channel.position);
		return this;
	}

	public function update(dt:Float) {
		timeline.position = (channel != null) ? channel.position : 0;
	}

	public function dispose() {
		channel.stop();
	}
}