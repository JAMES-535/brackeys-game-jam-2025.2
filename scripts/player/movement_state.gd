extends State

@export_group("References")
@export var body: CharacterBody2D
@export var ship: CharacterBody2D

var SPEED: float = 200.0
var FOLLOW_SPEED: float = 10.0
var FRICTION: float = 500.0
var MAX_ROTATION: float = 20.0
var ROTATION_SPEED: float = 10.0
var BOUNDS: float = 300.0

var cur_speed: float

func _state_ready(args = []) -> void:
	ship.global_position = body.global_position

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
