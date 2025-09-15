extends Control


func _on_play_again_button_pressed():
	# reset all global values before changing scene here
	get_tree().change_scene_to_file("res://scenes/game_tracker.tscn")


func _on_home_button_pressed():
	# reset all global values before changing scene here
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
