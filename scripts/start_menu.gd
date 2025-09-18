extends Control

func _on_start_button_pressed():
	$SlowBoxSpawner.stopSpawning()
	get_tree().change_scene_to_file("res://scenes/game_tracker.tscn")

func _on_quit_button_pressed():
	$SlowBoxSpawner.stopSpawning()
	get_tree().quit()

func _on_practice_button_pressed():
	Global.IS_PRACTICE = true
	Global.PRACTICE_GAME = "res://scenes/confirm_receive.tscn"
	
	Global.CURRENT_GAME = "Confirm Receive"
	
	get_tree().change_scene_to_file(Global.PRACTICE_GAME)


func _on_packingbutton_pressed():
	Global.IS_PRACTICE = true
	Global.PRACTICE_GAME = "res://scenes/packing.tscn"
	
	Global.CURRENT_GAME = "Packing"
	
	get_tree().change_scene_to_file(Global.PRACTICE_GAME)


func _on_shippingbutton_pressed():
	Global.IS_PRACTICE = true
	Global.PRACTICE_GAME = "res://scenes/shipping.tscn"
	
	Global.CURRENT_GAME = "Shipping"
	
	get_tree().change_scene_to_file(Global.PRACTICE_GAME)


func _on_ready():
	$BGMusic.play()
	$SlowBoxSpawner.startSpawning()
