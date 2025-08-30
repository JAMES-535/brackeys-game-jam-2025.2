extends Label

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	EventBus.gameplay.show_tutorial.connect(_on_show_tutorial)
	
func _on_show_tutorial() -> void:
	anim_player.play("pulse")
