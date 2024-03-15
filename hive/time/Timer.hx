package hive.time;

@:allow(hive)
class Timer {
	var game:Game;

	public var started(default, null):Bool = false;
	public var paused:Bool = false;
	public var completed(default, null):Bool = false;
	public var duration(default, null):Float;
	public var elapsed(default, null):Float;
	public var repeats:Int;

	public dynamic function onComplete(tmr:Timer) {}

	function new() {}

	public function run(duration:Float, onComplete:(Timer)->Void, repeats:Int = 1):Timer {
		this.duration = duration;
		this.onComplete = onComplete;
		this.repeats = repeats;
		started = true;
		return this;
	}

	function update(dt:Float) {
		if (!started || paused || repeats < 1)
			return;

		elapsed += dt;
		if (elapsed > duration) {
			elapsed -= duration;
			repeats--;
			onComplete(this);
		}
	}
}