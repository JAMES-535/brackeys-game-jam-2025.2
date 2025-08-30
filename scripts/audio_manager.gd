extends AudioStreamPlayer

var low_pass_filter: AudioEffectLowPassFilter

var t_pitch_scale: float = 1.0
var t_low_pass: int = 20500.0

func _ready() -> void:
	low_pass_filter = AudioServer.get_bus_effect(1, 0)
	EventBus.gameplay.set_slow.connect(_on_set_slow)
	EventBus.details.set_music_volume.connect(_on_set_music_volume)
	

func _process(delta: float) -> void:
	pitch_scale = move_toward(pitch_scale, t_pitch_scale, 1 - exp(delta * -2.0))
	low_pass_filter.cutoff_hz = move_toward(low_pass_filter.cutoff_hz, t_low_pass, 1 - exp(delta * -2.0))


func _on_set_slow(is_slow: bool) -> void:
	if is_slow:
		t_pitch_scale = 0.5
		t_low_pass = 2000.0
	else:
		t_pitch_scale = 1.0
		t_low_pass = 20500.0


func _on_set_music_volume(vol: float) -> void:
	volume_db = vol
