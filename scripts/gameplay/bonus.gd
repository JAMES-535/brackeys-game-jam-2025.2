extends Area2D
class_name Bonus

@onready var label: RichTextLabel = $RichTextLabel

var amt: int = 10

func _ready() -> void:
	amt = randi_range(1, 9) * 10
	label.text = "+" + str(amt)
