package hive.physics;

import hive.backend.PhysBackend;
import hive.math.Vector;
import hive.display.Sprite;

class Object extends Sprite {
	public var velocity(default, null):Vector = new Vector();
	public var gravity(default, null):Vector = new Vector();

	public var maxVelocity(default, null):Vector = new Vector(10000, 10000, 10000);
	
	override function update(dt:Float) {
		if (game != null)
			game.phys.list.push(this);
		
		updateMotion(dt);

		super.update(dt);
	}

	function updateMotion(dt:Float) {
		var dv:Float = 0.5 * (game.phys.computeVelocity(velocity.z, gravity.z, maxVelocity.z, dt) - velocity.z);
		velocity.z += dv;
		rotation += velocity.z * dt;
		velocity.z += dv;

		dv = 0.5 * (game.phys.computeVelocity(velocity.x, gravity.x, maxVelocity.x, dt) - velocity.x);
		velocity.x += dv;
		position.x += velocity.x * dt;
		velocity.x += dv;

		dv = 0.5 * (game.phys.computeVelocity(velocity.y, gravity.y, maxVelocity.y, dt) - velocity.y);
		velocity.y += dv;
		position.y += velocity.y * dt;
		velocity.y += dv;
	}
}