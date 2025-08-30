extends CanvasLayer

@onready var score_counter: RichTextLabel = $ScoreCounter

func _ready() -> void:
	EventBus.gameplay.score_change.connect(_on_score_change)
	
func _on_score_change(new_score: int) -> void:
	score_counter.text = str(new_score)
