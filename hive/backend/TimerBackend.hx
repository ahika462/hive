package hive.backend;

import hive.time.Timer;

@:allow(hive)
class TimerBackend extends Backend {
	var list:Array<Timer> = [];

	public function add(timer:Timer):Null<Int> {
		if (timer == null)
			return null;

		timer.game = game;

		return list.push(timer);
	}

	public function remove(timer:Timer):Bool {
		if (timer == null)
			return false;

		return list.remove(timer);
	}

	public function run(duration:Float, onComplete:(Timer)->Void, repeats:Int = 1):Timer {
		var timer:Timer = new Timer().run(duration, onComplete, repeats);
		add(timer);
		return timer;
	}

	override function update(dt:Float) {
		for (timer in list)
			timer.update(dt);

		super.update(dt);
	}
}