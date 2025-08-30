extends Node

@onready var score_timer: Timer = $ScoreTimer
var score_frequency: float = 0.5

var score: int = 0
var target_time_scale: float = 1.0
var time_shift_speed: float = 50.0

func _ready() -> void:
	EventBus.gameplay.game_start.connect(_on_game_start)
	EventBus.gameplay.game_over.connect(_on_game_over)
	EventBus.gameplay.add_score.connect(_on_add_score)
	EventBus.gameplay.set_slow.connect(_on_set_slow)
	score_timer.timeout.connect(_on_timeout)
	EventBus.gameplay.game_start.emit.call_deferred()
	
func _process(delta: float) -> void:
	Engine.time_scale = lerp(Engine.time_scale, target_time_scale, delta * time_shift_speed)
	
func _on_game_start() -> void:
	score_timer.start(score_frequency)
	
func _on_game_over() -> void:
	score_timer.stop()
	EventBus.gameplay.set_slow.emit(false)
	
func _on_add_score(amt: int) -> void:
	score += amt
	EventBus.gameplay.score_change.emit(score)
	
func _on_timeout() -> void:
	score += 1
	EventBus.gameplay.score_change.emit(score)

func _on_set_slow(is_slow: bool) -> void:
	print("updating time")
	if is_slow:
		target_time_scale = 0.2
	else:
		target_time_scale = 1.0
