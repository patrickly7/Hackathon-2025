extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_tracker.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_practice_button_pressed():
	Global.IS_PRACTICE = true
	Global.PRACTICE_GAME = "res://scenes/picking.tscn"
	
	Global.CURRENT_GAME = "Picking"
	
	get_tree().change_scene_to_file(Global.PRACTICE_GAME)
