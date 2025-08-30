@tool
extends Node

@export_tool_button("Reset Save", "Callable") var reset_save_action = reset_save

var save_location: String = "user://savegame.save"

var high_score: int = 0.0
var first_time: bool = true

func _ready() -> void:
	load_game.call_deferred()

func save_game() -> void:
	var save_file = FileAccess.open(save_location, FileAccess.WRITE)
	
	var json_string = JSON.stringify({"high_score": high_score})
	save_file.store_line(json_string)
	
	json_string = JSON.stringify({"first_time": first_time})
	save_file.store_line(json_string)
	
func load_game() -> void:
	if not FileAccess.file_exists(save_location):
		return
		
	var save_file = FileAccess.open(save_location, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			return
		var data = json.data
		print(data)
		for i in data.keys():
			set(i, data[i])

func reset_save() -> void:
	print("RESET SAVE FILE")
	if FileAccess.file_exists(save_location):
		DirAccess.remove_absolute(save_location)
