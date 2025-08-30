@tool
extends Sprite2D

var _elapsed_time: float = 0.0
var _warp_speed: float = 50.0

func _ready() -> void:
	_elapsed_time = randf_range(0, 1000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_elapsed_time += delta * _warp_speed
	material.get("shader_parameter/noise").get("noise").set("offset", Vector3(0.0, 0.0, _elapsed_time))
	material.set("shader_parameter/sprite_scale", scale)
