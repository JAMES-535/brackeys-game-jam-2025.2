extends Node

@export var obstacle: Array[PackedScene]

@onready var timer: Timer = $Timer

var frequency: float = 5.0

func _ready() -> void:
	EventBus.gameplay.game_start.connect(_on_game_start)
	timer.timeout.connect(_on_timeout)

func _on_game_start() -> void:
	timer.start(frequency)

func _on_timeout() -> void:
	var new_wall: Node2D = obstacle.pick_random().instantiate()
	new_wall.global_position = Vector2(randf_range(-70, 70), -250)
	add_child(new_wall)
