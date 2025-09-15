extends Node

const GAME_TIME = 10

func _ready():
	$GameTimer.startTimer(GAME_TIME)
	$CardQuantityInput.value_changed.connect(on_spin_box_value_changed)

func on_spin_box_value_changed(new_value):
	print("SpinBox value changed to: ", new_value)

func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/final_results_screen.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
