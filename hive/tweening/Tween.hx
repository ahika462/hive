package hive.tweening;

import hive.tweening.Ease.Easing;
import hive.time.Timer;

@:allow(hive)
class Tween {
	var game:Game;

	var timer:Timer;
	var progress:Float;
	var ease:Easing = Ease.linear;

	var startDelay:Float;
	var startElapsed:Float = 0;

	var target:Dynamic;
	var from:Dynamic;
	var to:Dynamic;

	public var paused(get, set):Bool;
	inline function get_paused():Bool {
		return timer != null ? timer.paused : false;
	}
	inline function set_paused(value:Bool):Bool {
		return timer != null ? timer.paused = value : value;
	}

	public dynamic function onComplete(twn:Tween) {}

	function new() {}

	public function run(target:Dynamic, from:Dynamic, to:Dynamic, duration:Float, options:TweenOptions):Tween {
		this.target = target;
		this.from = from;
		this.to = to;
		ease = options.ease ?? Ease.linear;
		onComplete = options.onComplete ?? (twn:Tween) -> {};
		startDelay = options.startDelay ?? 0;

		timer = game.timer.run(duration, (tmr:Timer) -> onComplete(this));
		return this;
	}
	
	function update(dt:Float) {
		if (startElapsed < startDelay) {
			startElapsed += dt;
			return;
		}

		if (timer == null)
			return;
		
		var prevProgress:Float = progress;
		progress = timer.elapsed / timer.duration;
		if (prevProgress >= progress)
			return;
		
		for (field in Reflect.fields(to)) {
			var a:Float = Reflect.field(from, field);
			var b:Float = Reflect.field(to, field);

			Reflect.setField(target, field, a + ease(progress) * (b - a));
		}
	}
}