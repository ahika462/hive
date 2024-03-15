package hive.backend;

import hive.tweening.TweenOptions;
import hive.tweening.Tween;

class TweenBackend extends Backend {
	var list:Array<Tween> = [];

	public function add(tween:Tween):Null<Int> {
		if (tween == null)
			return null;

		tween.game = game;

		return list.push(tween);
	}

	public function remove(tween:Tween):Bool {
		if (tween == null)
			return false;

		return list.remove(tween);
	}

	public function run(target:Dynamic, props:Dynamic, duration:Float, ?options:TweenOptions):Tween {
		var from:Dynamic = {};
		for (field in Reflect.fields(props))
			Reflect.setField(from, field, Reflect.field(target, field));

		var tween:Tween = new Tween();
		add(tween);
		tween.run(target, from, props, duration, options ?? {});
		return tween;
	}

	override function update(dt:Float) {
		for (tween in list)
			tween.update(dt);

		super.update(dt);
	}
}