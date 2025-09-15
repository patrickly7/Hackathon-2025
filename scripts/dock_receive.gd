extends Node2D

const GAME_TIME = 10

func _ready():
	$GameTimer.startTimer(GAME_TIME)

func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/confirm_receive.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
