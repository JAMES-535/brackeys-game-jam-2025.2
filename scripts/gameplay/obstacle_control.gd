extends AnimatableBody2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if global_position.y > 1000.0:
		queue_free()
	
func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0, 2.0))
