extends Control


func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_tracker.tscn")
