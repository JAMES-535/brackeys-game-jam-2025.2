extends Node

var gameplay := GamePlay.new()

class GamePlay:
	signal game_start
	signal score_change(new_score: int)
	signal game_over
	signal add_score(amt: int)
	signal set_slow(is_slow: bool)
