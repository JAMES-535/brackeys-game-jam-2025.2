extends AnimatableBody2D

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0, 2.0))
