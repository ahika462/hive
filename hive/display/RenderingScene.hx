package hive.display;

import h2d.RenderContext;
import h2d.Scene;

class RenderingScene extends Scene {
	var game:Game;

	public function new() {
		super();
		ctx.begin();
		// ctx = new RenderContext(this);
	}

	override function draw(ctx:RenderContext) {
		if (game.state != null)
			game.state.render(ctx);

		super.draw(ctx);
	}
}