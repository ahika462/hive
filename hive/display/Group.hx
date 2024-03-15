package hive.display;

import h2d.RenderContext;

@:allow(hive)
class Group<T:Base = Base> extends Base {
	public var members:Array<T> = [];

	public function new() {}

	public function add(member:T):Null<Int> {
		if (member == null)
			return null;

		member.game = game;

		return members.push(member);
	}

	public function insert(member:T, pos:Int) {
		if (member == null)
			return;

		members.insert(pos, member);
	}

	public function remove(member:T):Bool {
		if (member == null)
			return false;

		return members.remove(member);
	}

	override function update(dt:Float) {
		for (member in members)
			member.update(dt);

		super.update(dt);
	}

	override function render(ctx:RenderContext) {
		for (member in members)
			member.render(ctx);

		super.render(ctx);
	}

	override function dispose() {
		for (member in members)
			member.dispose();

		super.dispose();
	}
}