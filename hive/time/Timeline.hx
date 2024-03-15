package hive.time;

class Timeline {
	public var length(default, set):Float;
	function set_length(value:Float):Float {
		return length = value;
	}

	public var position(default, set):Float;
	function set_position(value:Float):Float {
		return position = value;
	}

	public function new(length:Float = 0, position:Float = 0) {
		this.length = length;
		this.position = position;
	}
}