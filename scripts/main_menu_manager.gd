extends Node2D

var game_scene: PackedScene = load("res://scenes/game.tscn")

@onready var play_button: Button = $CanvasLayer/VBoxContainer/Play
@onready var high_score_text: Label = $CanvasLayer/HighScore

func _ready() -> void:
	EventBus.details.set_music_volume.emit(-10.0)
	play_button.pressed.connect(_on_play)
	SaveManager.load_game()
	high_score_text.text = "High Score: " + str(SaveManager.high_score)


func _on_play() -> void:
	TransitionManager.instance.change_scene(game_scene)
