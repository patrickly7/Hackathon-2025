extends Control

func _ready():
	$StationTitle.text = Global.CURRENT_GAME
	if (Global.CURRENT_GAME == "Dock Receive"):
		$LastGameBubble.hide()
		$MiniBubblesLeft.hide()
	elif (Global.CURRENT_GAME == "Shipping"):
		$NextGameBubble.hide()
		$MiniBubblesRight.hide()

func _input(event):
	if event.is_action_pressed("action"):
		get_tree().change_scene_to_file(Global.NEXT_GAME_SCENE)
