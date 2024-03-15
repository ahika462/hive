package hive.math;

class Rect {
	public var x(default, set):Float;
	function set_x(value:Float):Float {
		return x = value;
	}

	public var y(default, set):Float;
	function set_y(value:Float):Float {
		return y = value;
	}

	public var width(default, set):Float;
	function set_width(value:Float):Float {
		return width = value;
	}

	public var height(default, set):Float;
	function set_height(value:Float):Float {
		return height = value;
	}

	public function new(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0) {
		set(x, y, width, height);
	}

	public function set(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0):Rect {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		return this;
	}

	public function abs():Rect {
		return new Rect(Math.abs(x), Math.abs(y), Math.abs(width), Math.abs(height));
	}

	public function sqrt():Rect {
		return new Rect(Math.sqrt(x), Math.sqrt(y), Math.sqrt(width), Math.sqrt(height));
	}

	public function round():Rect {
		return new Rect(Math.round(x), Math.round(y), Math.round(width), Math.round(height));
	}

	public function floor():Rect {
		return new Rect(Math.floor(x), Math.floor(y), Math.floor(width), Math.floor(height));
	}

	public function ceil():Rect {
		return new Rect(Math.ceil(x), Math.ceil(y), Math.ceil(width), Math.ceil(height));
	}

	public function int():{x:Int, y:Int, width:Int, height:Int} {
		return {
			x: Std.int(x),
			y: Std.int(y),
			width: Std.int(width),
			height: Std.int(height)
		};
	}
}