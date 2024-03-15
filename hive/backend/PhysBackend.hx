package hive.backend;

import hive.physics.Object;
import hive.math.Rect;

@:allow(hive)
class PhysBackend extends Backend {
	public var bounds:Rect = new Rect();
	
	var list:Array<Object> = [];

	function new(game:Game) {
		super(game);
		// bounds = new Rect(0, 0, game.renderer.width, game.renderer.height);
	}

	public inline function computeVelocity(velocity:Float, gravity:Float, max:Float, elapsed:Float):Float {
		if (gravity != 0)
			velocity += gravity * elapsed;
		
		if (velocity != 0 && max != 0) {
			if (velocity > max)
				velocity = max;
			else if (velocity < -max)
				velocity = -max;
		}

		return velocity;
	}

	override function update(dt:Float) {
		if (bounds.width <= 0 || bounds.height <= 0) {
			super.update(dt);
			return;
		}

		#if hive_physics_testing
		for (member in list) {
			if (member.position.x < bounds.x) {
				member.position.x = bounds.x;
				member.velocity.x = Math.max(member.velocity.x, 0);
			}
			if (member.position.x + member.width > bounds.x + bounds.width) {
				member.position.x = bounds.x + bounds.width - member.width;
				member.velocity.x = Math.min(member.velocity.x, 0);
			}
			if (member.position.y < bounds.y) {
				member.position.y = bounds.y;
				member.velocity.y = Math.max(member.velocity.y, 0);
			}
			if (member.position.y + member.height > bounds.y + bounds.height) {
				member.position.y = bounds.y + bounds.height - member.height;
				member.velocity.y = Math.min(member.velocity.y, 0);
			}
		}
		#end

		super.update(dt);
	}
}