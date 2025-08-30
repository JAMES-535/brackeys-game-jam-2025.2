extends Node
class_name StateMachine

@export var current_state: State

func _ready() -> void:
	current_state._state_ready()

func _process(delta: float) -> void:
	current_state._state_process(delta)

func _physics_process(delta: float) -> void:
	current_state._state_physics_process(delta)

func _input(event: InputEvent) -> void:
	current_state._state_input(event)

func change_state(state: String, args = []) -> void:
	for c in get_children():
		if c.name == state:
			current_state._state_exit()
			current_state = c
			current_state._state_ready(args)
			break;
