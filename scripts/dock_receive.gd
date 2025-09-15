extends Node2D

const GAME_TIME = 10

func _ready():
	$GameTimer.startTimer(GAME_TIME)

func _input(event):
	if event.is_action_pressed("move_left"):
		var tween = create_tween()
		tween.tween_property($Player, "global_position", Vector2(100, 200), 1.0) # Move to (100, 200) over 1 second

func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/confirm_receive.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
