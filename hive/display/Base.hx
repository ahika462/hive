package hive.display;

import h2d.RenderContext;

@:allow(hive)
class Base implements IHived {
	var game(default, null):Game;
	public function update(dt:Float) {}
	public function render(ctx:RenderContext) {}
	public function dispose() {}
}