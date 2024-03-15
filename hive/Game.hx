package hive;

import hive.backend.TweenBackend;
import hive.backend.PhysBackend;
import hive.backend.TimerBackend;
import hive.backend.SoundBackend;
import h3d.impl.MemoryManager;
import h3d.Engine;
import hive.display.RenderingScene;
import hive.display.State;
import h2d.Drawable;
import hive.math.Point;
import hxd.App;

@:access(h2d.Scene)
@:access(h3d.Engine)
@:access(h2d.Drawable)
class Game extends App {
	public var renderer(default, null):RenderingScene;
	public var size(default, null):CallbackPoint;
	public var display(default, null):Drawable;

	public var sound(default, null):SoundBackend;
	public var timer(default, null):TimerBackend;
	public var tween(default, null):TweenBackend;
	public var phys(default, null):PhysBackend;

	public var state(default, null):State;

	public var framerate(get, set):Int;
	inline function get_framerate():Int {
		return renderer.window.framerate;
	}
	inline function set_framerate(value:Int):Int {
		renderer.window.framerate = value;
		return value;
	}

	public var fps(get, never):Float;
	inline function get_fps():Float {
		return engine.realFps;
	}

	public var mem(get, never):MemoryManager;
	inline function get_mem():MemoryManager {
		return engine.mem;
	}

	public var fullscreen(get, set):Bool;
	inline function get_fullscreen():Bool {
		return renderer.window.displayMode == Fullscreen || renderer.window.displayMode == Borderless;
	}
	inline function set_fullscreen(value:Bool):Bool {
		renderer.window.displayMode = value ? Borderless : Windowed;
		return value;
	}

	var options:GameOptions;
	public function new(options:GameOptions) {
		this.options = options;
		super();
	}

	override function init() {
		renderer = new RenderingScene();
		renderer.game = this;
		setScene2D(renderer);
		resize(options.size);
		display = new Drawable(null);

		sound = new SoundBackend(this);
		timer = new TimerBackend(this);
		tween = new TweenBackend(this);
		phys = new PhysBackend(this);

		switchState(Type.createInstance(options.state, []));

		fullscreen = options.fullscreen;
	}

	public function resize(size:Point) {
		var prepared = size.abs().int();
		if (prepared.x == 0)
			prepared.x = renderer.window.width;
		if (prepared.y == 0)
			prepared.y = renderer.window.height;

		this.size = new CallbackPoint(prepared.x, prepared.y, resize, resize, resize);
		renderer.scaleMode = Stretch(prepared.x, prepared.y);
	}

	public function switchState(nextState:State, disposePrevious:Bool = true) {
		if (disposePrevious && state != null)
			state.dispose();
		
		state = nextState;
		state.game = this;
		state.create();
	}

	override function update(dt:Float) {
		sound.update(dt);
		timer.update(dt);
		tween.update(dt);

		if (state != null)
			state.update(dt);

		phys.update(dt);
	}

	override function render(e:Engine) {
		if (renderer.window.displayMode == Fullscreen)
			renderer.window.displayMode = Borderless;

		renderer.draw(renderer.ctx);

		super.render(e);
	}
}

@:structInit @:publicFields class GameOptions {
	var size:Point = new Point();
	var state:Class<State> = State;
	var framerate:Int = 60;
	var fullscreen:Bool = false;
}