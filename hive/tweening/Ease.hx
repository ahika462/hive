package hive.tweening;

typedef Easing = (Float)->Float;

@:structInit class Ease {
	public static final linear:Easing = (x:Float) -> return x;
	
	public static final sine:Ease = {
		In: (x:Float) -> return 1 - Math.cos((x * Math.PI) / 2),
		Out: (x:Float) -> return Math.sin((x * Math.PI) / 2),
		InOut: (x:Float) -> return -(Math.cos(Math.PI * x) - 1) / 2
	};

	public static final quad:Ease = {
		In: (x:Float) -> return x * x,
		Out: (x:Float) -> return 1 - (1 - x) * (1 - x),
		InOut: (x:Float) -> return x < 0.5 ? 2 * x * x : 1 - Math.pow(-2 * x + 2, 2) / 2
	};

	public static final cubic:Ease = {
		In: (x:Float) -> return x * x * x,
		Out: (x:Float) -> return 1 - Math.pow(1 - x, 3),
		InOut: (x:Float) -> return x < 0.5 ? 4 * x * x * x : 1 - Math.pow(-2 * x + 2, 3) / 2
	};

	public static final quart:Ease = {
		In: (x:Float) -> return x * x * x * x,
		Out: (x:Float) -> return 1 - Math.pow(1 - x, 4),
		InOut: (x:Float) -> return x < 0.5 ? 8 * x * x * x * x : 1 - Math.pow(-2 * x + 2, 4) / 2
	};

	public static final quint:Ease = {
		In: (x:Float) -> return x * x * x * x * x,
		Out: (x:Float) -> return 1 - Math.pow(1 - x, 5),
		InOut: (x:Float) -> return x < 0.5 ? 16 * x * x * x * x * x : 1 - Math.pow(-2 * x + 2, 5) / 2
	};

	public static final expo:Ease = {
		In: (x:Float) -> return x == 0 ? 0 : Math.pow(2, 10 * x - 10),
		Out: (x:Float) -> return x == 1 ? 1 : 1 - Math.pow(2, -10 * x),
		InOut: (x:Float) -> x == 0 ? 0 : x == 1 ? 1 : x < 0.5 ? Math.pow(2, 20 * x - 10) / 2 : (2 - Math.pow(2, -20 * x + 10)) / 2
	};

	public static final circ:Ease = {
		In: (x:Float) -> return 1 - Math.sqrt(1 - Math.pow(x, 2)),
		Out: (x:Float) -> return Math.sqrt(1 - Math.pow(x - 1, 2)),
		InOut: (x:Float) -> return x < 0.5 ? (1 - Math.sqrt(1 - Math.pow(2 * x, 2))) / 2 : (Math.sqrt(1 - Math.pow(-2 * x + 2, 2)) + 1) / 2
	};

	public static final back:Ease = {
		In: (x:Float) -> {
			final c1:Float = 1.70158;
			final c3:Float = c1 + 1;
			return c3 * x * x * x - c1 * x * x;
		},
		Out: (x:Float) -> {
			final c1:Float = 1.70158;
			final c3:Float = c1 + 1;
			return 1 + c3 * Math.pow(x - 1, 3) + c1 * Math.pow(x - 1, 2);
		},
		InOut: (x:Float) -> {
			final c1:Float = 1.70158;
			final c2:Float = c1 * 1.525;
			return x < 0.5 ? (Math.pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2 : (Math.pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2;
		}
	};

	public static final elastic:Ease = {
		In: (x:Float) -> {
			final c4:Float = (2 * Math.PI) / 3;
			return x == 0 ? 0 : x == 1 ? 1 : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
		},
		Out: (x:Float) -> {
			final c4:Float = (2 * Math.PI) / 3;
			return x == 0 ? 0 : x == 1 ? 1 : Math.pow(2, -10 * x) * Math.sin((x * 10 - 0.75) * c4) + 1;
		},
		InOut: (x:Float) -> {
			final c5:Float = (2 * Math.PI) / 4.5;
			return x == 0 ? 0 : x == 1 ? 1 : x < 0.5 ? -(Math.pow(2, 20 * x - 10) * Math.sin((20 * x - 11.125) * c5)) / 2 : (Math.pow(2, -20 * x + 10) * Math.sin((20 * x - 11.125) * c5)) / 2 + 1;
		}
	};

	public static final bounce:Ease = {
		In: (x:Float) -> return 1 - bounce.Out(1 - x),
		Out: (x:Float) -> {
			final n1:Float = 7.5625;
			final d1:Float = 2.75;

			if (x < 1 / d1)
				return n1 * x * x;
			else if (x < 2 / d1)
				return n1 * (x -= 1.5 / d1) * x + 0.75;
			else if (x < 2.5 / d1)
				return n1 * (x -= 2.25 / d1) * x + 0.9375;
			else
				return n1 * (x -= 2.625 / d1) * x + 0.984375;
		},
		InOut: (x:Float) -> {
			return x < 0.5 ? (1 - bounce.Out(1 - 2 * x)) / 2 : (1 + bounce.Out(2 * x - 1)) / 2;
		}
	};

	public var In(default, null):Easing;
	public var Out(default, null):Easing;
	public var InOut(default, null):Easing;
}