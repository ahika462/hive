package hive.backend;

@:allow(hive)
class Backend implements IHived {
	var game:Game;

	function new(game:Game) {
		this.game = game;
	}

	public function update(dt:Float) {}
}