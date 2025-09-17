extends Control

func _ready():
	var totalTimeTaken = 0
	
	var times = [
		Global.DOCK_RECEIVE_TIME_TAKEN,
		Global.CONFIRM_RECEIVE_TIME_TAKEN,
		Global.INVENTORY_TIME_TAKEN,
		Global.PICKING_TIME_TAKEN,
		Global.PACKING_TIME_TAKEN,
		Global.SHIPPING_TIME_TAKEN
	]
	
	for i in range(times.size()):
		totalTimeTaken += int(times[i])
	
	var finalMedal = "Gold"
	var goldCount = 0
	var silverCount = 0
	var bronzeCount = 0
	
	var medals = [
		Global.DOCK_RECEIVE_MEDAL,
		Global.CONFIRM_RECEIVE_MEDAL,
		Global.INVENTORY_MEDAL,
		Global.PICKING_MEDAL,
		Global.PACKING_MEDAL,
		Global.SHIPPING_MEDAL
	]
	
	for i in range(medals.size()):
		if (medals[i] == "Gold"):
			goldCount += 1
		elif (medals[i] == "Silver"):
			silverCount += 1
		else:
			bronzeCount += 1
			
	if (goldCount == 6):
		finalMedal = "Gold"
	elif (bronzeCount == 0):
		finalMedal = "Silver"
	else:
		finalMedal = "Bronze"
	
	await get_tree().create_timer(0.5).timeout
	$DockReceiveMedal.show()
	
	await get_tree().create_timer(0.5).timeout
	$ConfirmReceiveMedal.show()
	
	await get_tree().create_timer(0.5).timeout
	$InventoryMedal.show()
	
	await get_tree().create_timer(0.5).timeout
	$PickingMedal.show()
	
	await get_tree().create_timer(0.5).timeout
	$PackingMedal.show()
	
	await get_tree().create_timer(0.5).timeout
	$ShippingMedal.show()
	
	await get_tree().create_timer(1).timeout
	
	$FinalMedal.show()
	if (finalMedal == "Gold"):
		$GoodJobText.show()
	elif (finalMedal == "Silver"):
		$OkayJobText.show()
	else:
		$BadJobText.show()
	
	$TotalTimeText.text = "Total Time: " + str(totalTimeTaken) + " secs"
	$TotalTimeText.show()
	$PlayAgainButton.show()
	$HomeButton.show()

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
