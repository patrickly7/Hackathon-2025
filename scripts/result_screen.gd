extends Control

var timeTaken = 0
var mistakes = 0
var medal = "Gold"

func _ready():
	$StationTitle.text = Global.CURRENT_GAME
	getCurrentGameResults()
	
	showTimeTakenText()
	showMistakesText()
	showMedal()

func getCurrentGameResults():
	match Global.CURRENT_GAME:
		"Dock Receive":
			timeTaken = Global.DOCK_RECEIVE_TIME_TAKEN
			mistakes = Global.DOCK_RECEIVE_MISTAKES
			medal = Global.DOCK_RECEIVE_MEDAL
		"Confirm Receive":
			timeTaken = Global.CONFIRM_RECEIVE_TIME_TAKEN
			mistakes = Global.CONFIRM_RECEIVE_MISTAKES
			medal = Global.CONFIRM_RECEIVE_MEDAL
		"Inventory":
			timeTaken = Global.INVENTORY_TIME_TAKEN
			mistakes = Global.INVENTORY_MISTAKES
			medal = Global.INVENTORY_MEDAL
		"Picking":
			timeTaken = Global.PICKING_TIME_TAKEN
			mistakes = Global.PICKING_MISTAKES
			medal = Global.PICKING_MEDAL
		"Packing":
			timeTaken = Global.PACKING_TIME_TAKEN
			mistakes = Global.PACKING_MISTAKES
			medal = Global.PACKING_MEDAL
		"Shipping":
			timeTaken = Global.SHIPPING_TIME_TAKEN
			mistakes = Global.SHIPPING_MISTAKES
			medal = Global.SHIPPING_MEDAL
		_:
			pass

func showTimeTakenText():
	$TimeTakenValue.text = str(timeTaken) + " secs"
	$TimeTakenValue.show()
	
func showMistakesText():
	$MistakesValue.text = str(mistakes)
	$MistakesValue.show()
	
func showMedal():
	if medal == "Gold":
		$GoodJobText.show()
		$GoodJobSFX.play()
		$ResultMedal.texture = load("res://assets/art/Good_Medal.png")
	elif medal == "Silver":
		$OkayJobText.show()
		$OkayJobSFX.play()
		$ResultMedal.texture = load("res://assets/art/Okay_Medal.png")
	else:
		$BadJobText.show()
		$BadJobSFX.play()
		$ResultMedal.texture = load("res://assets/art/Bad_Medal.png")

func _on_continue_button_pressed():
	if (Global.IS_PRACTICE):
		get_tree().change_scene_to_file(Global.PRACTICE_GAME)
		return
	
	if (Global.NEXT_GAME_SCENE != ""):
		get_tree().change_scene_to_file("res://scenes/game_tracker.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/final_results_screen.tscn")	
		
	Global.prepareNextGame()
