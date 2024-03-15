package hive.math;

class Point {
	public var x(default, set):Float;
	function set_x(value:Float):Float {
		return x = value;
	}

	public var y(default, set):Float;
	function set_y(value:Float):Float {
		return y = value;
	}

	public function new(x:Float = 0, y:Float = 0) {
		set(x, y);
	}

	public function set(x:Float = 0, y:Float = 0):Point {
		this.x = x;
		this.y = y;
		return this;
	}

	public function abs():Point {
		return new Point(Math.abs(x), Math.abs(y));
	}

	public function sqrt():Point {
		return new Point(Math.sqrt(x), Math.sqrt(y));
	}

	public function round():Point {
		return new Point(Math.round(x), Math.round(y));
	}

	public function floor():Point {
		return new Point(Math.floor(x), Math.floor(y));
	}

	public function ceil():Point {
		return new Point(Math.ceil(x), Math.ceil(y));
	}

	public function int():{x:Int, y:Int} {
		return {
			x: Std.int(x),
			y: Std.int(y)
		};
	}
}

class CallbackPoint extends Point {
	public dynamic function onSetX(point:Point) {}
	public dynamic function onSetY(point:Point) {}
	public dynamic function onSetXY(point:Point) {}

	public function new(x:Float = 0, y:Float = 0, onSetX:(Point)->Void, onSetY:(Point)->Void, onSetXY:(Point)->Void) {
		super(x, y);
		this.onSetX = onSetX;
		this.onSetY = onSetY;
		this.onSetXY = onSetXY;
	}

	override function set_x(value:Float):Float {
		this.x = value;
		onSetX(this);
		return value;
	}

	override function set_y(value:Float):Float {
		this.y = value;
		onSetY(this);
		return value;
	}

	override function set(x:Float = 0, y:Float = 0):Point {
		super.set(x, y);
		onSetXY(this);
		return this;
	}
}