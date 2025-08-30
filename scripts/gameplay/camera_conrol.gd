extends Camera2D

@export var ship: CharacterBody2D

var target_zoom: float = 1.0
var target_position: Vector2 = Vector2.ZERO
var zoom_speed: float = 5.0
var zoom_distance: float = 100.0

func _ready() -> void:
	EventBus.gameplay.set_slow.connect(_on_set_slow)

func _process(delta: float) -> void:
	zoom = zoom.lerp(Vector2(target_zoom, target_zoom), delta * zoom_speed)
	global_position = global_position.lerp(target_position, delta * zoom_speed)

func _on_set_slow(is_slow: bool) -> void:
	if is_slow:
		target_zoom = 1.2
		target_position = Vector2.ZERO.direction_to(ship.global_position) * zoom_distance
	else:
		target_zoom = 1.0
		target_position = Vector2.ZERO
