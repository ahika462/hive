package hive.tweening;

import hive.tweening.Ease.Easing;

typedef TweenOptions = {
	var ?ease:Easing;
	var ?onComplete:(Tween)->Void;
	var ?startDelay:Float;
}