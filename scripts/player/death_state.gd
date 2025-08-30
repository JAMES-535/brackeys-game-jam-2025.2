extends State

@export var ship: CharacterBody2D
@export var particles1: GPUParticles2D
@export var particles2: GPUParticles2D

@onready var death_audio: AudioStreamPlayer = $DeathAudio

var  direction: int

func _state_ready(args = []) -> void:
	EventBus.gameplay.player_damaged.emit()
	direction = [1, -1].pick_random()
	ship.velocity = Vector2(100 * direction, -200)
	particles1.emitting = false
	particles2.emitting = false
	death_audio.play()

func _state_physics_process(delta: float) -> void:
	ship.velocity.y += 9.81
	ship.rotation_degrees -= 5.0 * direction
	ship.move_and_slide()
