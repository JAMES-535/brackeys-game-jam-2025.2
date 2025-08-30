extends State

@export_group("References")
@export var body: CharacterBody2D
@export var ship: CharacterBody2D
@export var collision: Area2D

var SPEED: float = 400.0
var FOLLOW_SPEED: float = 10.0
var FRICTION: float = 500.0
var MAX_ROTATION: float = 20.0
var ROTATION_SPEED: float = 10.0
var BOUNDS: float = 300.0

var cur_speed: float

func _state_ready(args = []) -> void:
	EventBus.gameplay.game_over.connect(_on_game_over)
	collision.area_entered.connect(_on_area_enter)
	collision.area_exited.connect(_on_area_exit)
	ship.global_position = body.global_position

func _state_exit() -> void:
	EventBus.gameplay.game_over.disconnect(_on_game_over)
	collision.area_exited.disconnect(_on_area_exit)
	collision.area_entered.disconnect(_on_area_enter)

func _state_physics_process(delta: float) -> void:
	var input: float = Input.get_axis("left", "right")
	if input:
		body.velocity.x = input * SPEED
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, SPEED)
	
	body.move_and_slide()
	body.position.x = clampf(body.position.x, -BOUNDS, BOUNDS)
	
	#var dir = ship.global_position.direction_to(body.global_position).normalized()
	ship.global_position = ship.global_position.lerp(body.global_position, FOLLOW_SPEED * delta)
	if BOUNDS - abs(body.global_position.x) <= 0.01:
		ship.rotation_degrees = lerp(ship.rotation_degrees, 0.0, delta * ROTATION_SPEED)
	else:
		ship.rotation_degrees = lerp(ship.rotation_degrees, input * MAX_ROTATION, delta * ROTATION_SPEED)

func _on_area_enter(body: Node2D) -> void:
	if body is Obstacle or body is CannonBeam:
		EventBus.gameplay.game_over.emit()
	elif body is Bonus:
		body.disable()
		EventBus.gameplay.add_score.emit(body.amt)
	elif body is SlowZone:
		EventBus.gameplay.set_slow.emit(true)

func _on_area_exit(body: Node2D) -> void:
	if body is SlowZone:
		EventBus.gameplay.set_slow.emit(false)

func _on_game_over() -> void:
	state_machine.change_state("Death")
