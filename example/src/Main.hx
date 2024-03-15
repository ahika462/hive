import hive.math.Point;
import hive.Game;
import hxd.Res;

class Main {
	static function main() {
		Res.initEmbed();
		new Game({size: new Point(1280, 720), state: Test, framerate: 360});
	}
}