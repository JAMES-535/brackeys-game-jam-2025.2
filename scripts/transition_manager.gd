extends Node
class_name TransitionManager

static var instance: TransitionManager

@onready var anim_player: AnimationPlayer = $AnimationPlayer

@export var world_2d: Node2D
@export var current_scene: Node
var _next_scene: PackedScene


func _ready() -> void:
	if instance == null:
		instance = self
	else:
		queue_free()


func change_scene(scene: PackedScene) -> void:
	anim_player.play("close")
	_next_scene = scene


func _change_scene() -> void:
	current_scene.queue_free()
	current_scene = _next_scene.instantiate()
	world_2d.add_child(current_scene)
	anim_player.play("open")
