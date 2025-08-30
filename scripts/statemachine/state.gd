extends Node
class_name State

var state_machine: StateMachine

func _ready() -> void:
	state_machine = get_parent()

func _state_ready(args = []) -> void:
	pass
	
func _state_process(delta: float) -> void:
	pass
	
func _state_physics_process(delta: float) -> void:
	pass

func _state_input(event: InputEvent) -> void:
	pass

func _state_exit() -> void:
	pass
