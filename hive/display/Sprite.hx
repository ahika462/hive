package hive.display;

import h2d.RenderContext;
import hive.math.Point;
import h2d.Tile;

class Sprite extends Base {
	public var tile:Tile;

	public var position(default, null):Point = new Point();
	var size(default, null):Point = new Point();
	public var scale(default, null):Point = new Point(1, 1);
	public var rotation:Float;

	public var width(default, null):Float;
	public var height(default, null):Float;
	
	public var flipX(get, set):Bool;
	inline function get_flipX():Bool {
		return tile.xFlip;
	}
	inline function set_flipX(value:Bool):Bool {
		return tile.xFlip = value;
	}

	public var flipY(get, set):Bool;
	inline function get_flipY():Bool {
		return tile.yFlip;
	}
	inline function set_flipY(value:Bool):Bool {
		return tile.yFlip = value;
	}

	public var antialiasing:Bool = false;

	public function new(x:Float = 0, y:Float = 0, ?tile:Tile) {
		position = new Point(x, y);
		position.set(x, y);
		if (tile != null)
			load(tile);
	}

	public function load(tile:Tile):Sprite {
		this.tile = tile;
		size.set(tile.width, tile.height);
		return this;
	}

	public function updateHitbox():Sprite {
		this.width = size.x * scale.x;
		this.height = size.y * scale.y;

		return this;
	}

	override function render(ctx:RenderContext) {
		if (tile == null)
			return;

		tile.scaleToSize(size.x * scale.x, size.y * scale.y);
		tile.dx = position.x;
		tile.dy = position.y;
		ctx.drawTile(game.display, tile);
	}

	override function dispose() {
		tile.dispose();
		super.dispose();
	}
}