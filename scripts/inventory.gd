extends Node

const GAME_TIME = 15
var rng = RandomNumberGenerator.new()
var shelf = 1
var quantity = 0
var mistakes = 0

func _ready():
	$StartSFX.play()
	await get_tree().create_timer(1).timeout
	
	$ReadyText.hide()
	$StartText.show()
	
	rng.randomize()
	openNextShelf()
	$BGMusic.play()
	$GameTimer.startTimer(GAME_TIME)
	
	await get_tree().create_timer(0.25).timeout
	$StartText.hide()

func _input(event):
	if event.is_action_pressed("ui_accept"): # "ui_accept" is the default action for Enter
		checkCardQuantityInput()

func _on_enter_button_pressed() -> void:
	checkCardQuantityInput()

func checkCardQuantityInput():
	if $CardQuantityInput.value == quantity:
		$Correct.play()
		shelf+=1
		openNextShelf()
	else:
		$Rong.play()
		mistakes +=1

func calculateMedal():
	if mistakes<2 and shelf >6:
		Global.INVENTORY_MEDAL = "Gold"
	elif mistakes<5 and shelf >=4:
		Global.INVENTORY_MEDAL = "Silver"
	else:
		Global.INVENTORY_MEDAL = "Bronze"

func openNextShelf():
	match shelf:
		1:
			quantity = rng.randi_range(1,5)
			$Drawer1Closed.hide()
			$Drawer1.show()
			for i in quantity:
				$Drawer1.get_child(i).show()
			
		2:
			quantity = rng.randi_range(1,5)
			$Drawer1.hide()
			$Drawer1Closed.show()
			$Drawer2Closed.hide()
			$Drawer2.show()
			for i in quantity:
				$Drawer2.get_child(i).show()
		3:
			quantity = rng.randi_range(1,5)
			$Drawer2.hide()
			$Drawer2Closed.show()
			$Drawer3Closed.hide()
			$Drawer3.show()
			for i in quantity:
				$Drawer3.get_child(i).show()
		4:
			quantity = rng.randi_range(1,5)
			$Drawer3.hide()
			$Drawer3Closed.show()
			$Drawer4Closed.hide()
			$Drawer4.show()
			for i in quantity:
				$Drawer4.get_child(i).show()
		5:
			quantity = rng.randi_range(1,5)
			$Drawer4.hide()
			$Drawer4Closed.show()
			$Drawer5Closed.hide()
			$Drawer5.show()
			for i in quantity:
				$Drawer5.get_child(i).show()
		6:
			quantity = rng.randi_range(1,5)
			$Drawer5.hide()
			$Drawer5Closed.show()
			$Drawer6Closed.hide()
			$Drawer6.show()
			for i in quantity:
				$Drawer6.get_child(i).show()
		7:
			$Drawer6.hide()
			$Drawer6Closed.show()
			$GameTimer.stopTimer()

func _on_card_quantity_input_value_changed(value: float) -> void:	
	if value == $CardQuantityInput.max_value:
		$CardQuantityInput.value = $CardQuantityInput.min_value+1
	elif value == $CardQuantityInput.min_value:
		$CardQuantityInput.value = $CardQuantityInput.max_value-1

func _on_game_timer_game_timer_end(secondsLeft: int) -> void:
	$FinishText.show()
	$FinishSFX.play()
	await get_tree().create_timer(1).timeout
	$FinishText.hide()
	
	Global.INVENTORY_TIME_TAKEN = GAME_TIME - secondsLeft
	Global.INVENTORY_MISTAKES = mistakes
	calculateMedal()
	Global.NEXT_GAME_SCENE = "res://scenes/picking.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
