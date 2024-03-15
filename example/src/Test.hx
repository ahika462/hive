import hive.tweening.Ease;
import hive.time.Timer;
import hive.media.Sound;
import hxd.Res;
import hive.physics.Object;
import hive.display.State;

class Test extends State {
	var spr:Object;
	var snd:Sound;
	var tmr:Timer;

	override function create() {
		spr = new Object(100, 100, Res.idle.toTile());
		spr.gravity.set(0, 1000);
		// spr.flipX = true;
		spr.updateHitbox();
		add(spr);

		game.tween.run(spr.position, {x: 500}, 1, {ease: Ease.circ.InOut});

		snd = new Sound(game.sound).load(Res.hit);

		tmr = game.timer.run(1, (tmr:Timer) -> snd.play(), 3);

		game.phys.bounds.set(0, 0, game.renderer.width, game.renderer.height);

		super.create();
	}

	override function update(dt:Float) {
		spr.velocity.x = 0;
		if (hxd.Key.isDown(hxd.Key.A))
			spr.velocity.x -= 1000;
		if (hxd.Key.isDown(hxd.Key.D))
			spr.velocity.x += 1000;
		
		super.update(dt);
	}
}