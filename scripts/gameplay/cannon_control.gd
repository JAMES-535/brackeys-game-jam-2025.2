extends Node2D

@onready var _anim_player: AnimationPlayer = $AnimationPlayer
@onready var _blast_sound: AudioStreamPlayer = $BlastSound

var _active: bool = false

func _process(delta: float) -> void:
	if not _active and global_position.y > -200:
		_active = true
		_anim_player.play("blast")
	
	if global_position.y > 200:
		_blast_sound.volume_db = -80
