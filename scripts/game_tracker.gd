extends Control

func _ready():
	$BGMusic.play()
	$StationTitle.text = Global.CURRENT_GAME
	$DescriptionText.text = Global.DESCRIPTION_DICT[Global.CURRENT_GAME]
	
	if (Global.CURRENT_GAME == "Dock Receive"):
		$LastGameBubble.hide()
		$LastGameBubbleSprite.hide()
		$MiniBubblesLeft.hide()
	elif (Global.CURRENT_GAME == "Shipping"):
		$NextGameBubble.hide()
		$NextGameBubbleSprite.hide()
		$MiniBubblesRight.hide()
		
	setGameBubbleSprites()

func _input(event):
	if event.is_action_pressed("action"):
		get_tree().change_scene_to_file(Global.NEXT_GAME_SCENE)

func setGameBubbleSprites():
	match Global.CURRENT_GAME:
		"Dock Receive":
			$CurrentGameBubbleSprite.texture = load("res://assets/art/Dock_Receive_Icon.png")
			$NextGameBubbleSprite.texture = load("res://assets/art/Confirm_Receive_Icon.png")
		"Confirm Receive":
			$LastGameBubbleSprite.texture = load("res://assets/art/Dock_Receive_Icon.png")
			$CurrentGameBubbleSprite.texture = load("res://assets/art/Confirm_Receive_Icon.png")
			$NextGameBubbleSprite.texture = load("res://assets/art/Inventory_Icon.png")
		"Inventory":
			$LastGameBubbleSprite.texture = load("res://assets/art/Confirm_Receive_Icon.png")
			$CurrentGameBubbleSprite.texture = load("res://assets/art/Inventory_Icon.png")
			$NextGameBubbleSprite.texture = load("res://assets/art/Picking_Icon.png")
		"Picking":
			$LastGameBubbleSprite.texture = load("res://assets/art/Inventory_Icon.png")
			$CurrentGameBubbleSprite.texture = load("res://assets/art/Picking_Icon.png")
			$NextGameBubbleSprite.texture = load("res://assets/art/Packing_Icon.png")
		"Packing":
			$LastGameBubbleSprite.texture = load("res://assets/art/Picking_Icon.png")
			$CurrentGameBubbleSprite.texture = load("res://assets/art/Packing_Icon.png")
			$NextGameBubbleSprite.texture = load("res://assets/art/Shipping_Icon.png")
		"Shipping":
			$LastGameBubbleSprite.texture = load("res://assets/art/Packing_Icon.png")
			$CurrentGameBubbleSprite.texture = load("res://assets/art/Shipping_Icon.png")
