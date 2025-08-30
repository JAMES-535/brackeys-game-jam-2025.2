@tool
extends Sprite2D

var star_texture: ViewportTexture

var _elapsed_time: float = 0.0
var _warp_speed: float = 50.0

func _ready() -> void:
	_elapsed_time = randf_range(0, 1000)
	star_texture = GameManager.instance.stars_texture
	material.set("shader_parameter/stars", star_texture)
