extends Control

func _on_play_again_button_pressed():
	resetGame()
	get_tree().change_scene_to_file("res://scenes/game_tracker.tscn")

func _on_home_button_pressed():
	resetGame()
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")

func resetGame():
	Global.NEXT_GAME_SCENE = "res://scenes/dock_receive.tscn"
	Global.CURRENT_GAME = "Dock Receive"

	# Dock Receive
	Global.DOCK_RECEIVE_TIME_TAKEN = 0
	Global.DOCK_RECEIVE_MISTAKES = 0
	Global.DOCK_RECEIVE_MEDAL = "Gold"

	# Confirm Receive
	Global.CONFIRM_RECEIVE_TIME_TAKEN = 0
	Global.CONFIRM_RECEIVE_MISTAKES = 0
	Global.CONFIRM_RECEIVE_MEDAL = "Gold"

	# Inventory
	Global.INVENTORY_TIME_TAKEN = 0
	Global.INVENTORY_MISTAKES = 0
	Global.INVENTORY_MEDAL = "Gold"

	# Picking
	Global.PICKING_TIME_TAKEN = 0
	Global.PICKING_MISTAKES = 0
	Global.PICKING_MEDAL = "Gold"

	# Packing
	Global.PACKING_TIME_TAKEN = 0
	Global.PACKING_MISTAKES = 0
	Global.PACKING_MEDAL = "Gold"

	# Shipping
	Global.SHIPPING_TIME_TAKEN = 0
	Global.SHIPPING_MISTAKES = 0
	Global.SHIPPING_MEDAL = "Gold"
