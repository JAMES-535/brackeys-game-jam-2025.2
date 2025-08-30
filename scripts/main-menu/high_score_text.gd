extends Label

var _elapsed: float = 0
var _rotation_speed: float = 2.0
var _rotation_amp: float = 5.0

func _process(delta: float) -> void:
	rotation_degrees = sin(_elapsed) * _rotation_amp
	_elapsed += delta * _rotation_speed
