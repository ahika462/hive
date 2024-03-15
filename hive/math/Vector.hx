package hive.math;

class Vector {
	public var x(default, set):Float;
	function set_x(value:Float):Float {
		return x = value;
	}

	public var y(default, set):Float;
	function set_y(value:Float):Float {
		return y = value;
	}

	public var z(default, set):Float;
	function set_z(value:Float):Float {
		return z = value;
	}

	public function new(x:Float = 0, y:Float = 0, z:Float = 0) {
		set(x, y, z);
	}

	public function set(x:Float = 0, y:Float = 0, z:Float = 0):Vector {
		this.x = x;
		this.y = y;
		this.z = z;
		return this;
	}

	public function abs():Vector {
		return new Vector(Math.abs(x), Math.abs(y), Math.abs(z));
	}

	public function sqrt():Vector {
		return new Vector(Math.sqrt(x), Math.sqrt(y), Math.sqrt(z));
	}

	public function round():Vector {
		return new Vector(Math.round(x), Math.round(y), Math.round(z));
	}

	public function floor():Vector {
		return new Vector(Math.floor(x), Math.floor(y), Math.floor(z));
	}

	public function ceil():Vector {
		return new Vector(Math.ceil(x), Math.ceil(y), Math.ceil(z));
	}

	public function int():{x:Int, y:Int, z:Int} {
		return {
			x: Std.int(x),
			y: Std.int(y),
			z: Std.int(z)
		};
	}
}