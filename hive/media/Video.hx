/*package hive.media;

import h2d.RenderContext;
import hxd.res.Resource;
import h2d.Video as Display;
import hive.time.Timeline;
import hive.math.Point;
import hive.display.Base;

@:access(h2d.Video)
class Video extends Base {
	var display:Display;

	public var position(default, null):Point = new Point();
	public var scale(default, null):Point = new Point();
	public var timeline(default, null):Timeline = new Timeline();

	public var ready(default, null):Bool = false;

	public function new() {}

	public function play(source:Resource):Video {
		if (display != null)
			display.dispose();

		ready = false;

		display = new Display();
		display.loadResource(source, () -> {
			// timeline.length = display.
		});

		return this;
	}

	override function render(ctx:RenderContext) {
		ctx.drawTile(game.display, display.tile);

		super.render(ctx);
	}

	override function update(dt:Float) {
		timeline.position = display.time / 1000;

		super.update(dt);
	}
}*/