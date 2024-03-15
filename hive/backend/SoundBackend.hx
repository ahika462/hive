package hive.backend;

import hxd.res.Sound as Source;
import hive.media.Sound;

@:allow(hive)
class SoundBackend extends Backend {
	var list:Array<Sound> = [];

	public function add(sound:Sound):Null<Int> {
		if (sound == null)
			return null;

		sound.game = game;

		return list.push(sound);
	}

	public function remove(sound:Sound):Bool {
		if (sound == null)
			return false;

		return list.remove(sound);
	}

	public function play(res:Source, volume:Float = 1, loop:Bool = false):Sound {
		var sound:Sound = new Sound(this).load(res).play(volume, loop);
		add(sound);
		return sound;
	}

	override function update(dt:Float) {
		for (sound in list)
			sound.update(dt);

		super.update(dt);
	}
}