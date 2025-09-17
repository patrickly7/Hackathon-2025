extends Node2D

const GAME_TIME = 10
const BOXES_TO_PACK = 5

const KEYS = ["Left", "Right", "Up", "Down"]
var keySets = []

var currentKeyIndex = 0
var currentKeySetIndex = 0

var mistakes = 0

func _ready():
	$StartSFX.play()
	await get_tree().create_timer(1).timeout
	
	$ReadyText.hide()
	$StartText.show()
	
	$GameTimer.startTimer(GAME_TIME)
	$BGMusic.play()
	
	for i in range(BOXES_TO_PACK):
		# Get a set of three keys to press for each box
		var keys = []
		
		for j in range(3):
			var key = KEYS.pick_random()
			keys.append(key)
			
		keySets.append(keys)
		
	print(keySets)
	setUpKeySetVisuals()
	$LeftIcon.show()
	$MiddleIcon.show()
	$RightIcon.show()
	
	await get_tree().create_timer(0.25).timeout
	$StartText.hide()

func _input(event):
	if (event.is_action_pressed("move_left")):
		if (keySets[currentKeySetIndex][currentKeyIndex] == "Left"):
			# TODO - Change Sprite of Current Key to Pressed
			updateKeys()
		else:
			mistakes += 1
			
	elif (event.is_action_pressed("move_right")):
		if (keySets[currentKeySetIndex][currentKeyIndex] == "Right"):
			# TODO - Change Sprite of Current Key to Pressed
			updateKeys()
		else:
			mistakes += 1
	elif (event.is_action_pressed("move_down")):
		if (keySets[currentKeySetIndex][currentKeyIndex] == "Down"):
			# TODO - Change Sprite of Current Key to Pressed
			updateKeys()
		else:
			mistakes += 1
	elif (event.is_action_pressed("move_up")):
		if (keySets[currentKeySetIndex][currentKeyIndex] == "Up"):
			# TODO - Change Sprite of Current Key to Pressed
			updateKeys()
		else:
			mistakes += 1
		
func setUpKeySetVisuals():
	$LeftIcon.texture = load(get_Icon_Texture(keySets[currentKeySetIndex][0]))
	$MiddleIcon.texture = load(get_Icon_Texture(keySets[currentKeySetIndex][1]))
	$RightIcon.texture = load(get_Icon_Texture(keySets[currentKeySetIndex][2]))

func get_Icon_Texture(Icon):
	match Icon:
		"Up":
			return "res://assets/art/Arrow_Key_Up.png"
		"Down":
			return "res://assets/art/Arrow_Key_Down.png"
		"Left":
			return "res://assets/art/Arrow_Key_Left.png"
		"Right":
			return "res://assets/art/Arrow_Key_Right.png"
	

func updateKeys():
	currentKeyIndex += 1
	match currentKeyIndex:
		1:
			$PackageOpen.hide()
			$PackageFilled.show()
		2:
			$PackageFilled.hide()
			$Box.show()
		3:
			$PackageOpen.show()
			$Box.hide()
			print("Finished Key Set %s" % str(currentKeySetIndex))
			currentKeyIndex = 0
			currentKeySetIndex += 1
		
			if (currentKeySetIndex != BOXES_TO_PACK):
				setUpKeySetVisuals()
		
	if (currentKeySetIndex == BOXES_TO_PACK):
		$GameTimer.stopTimer()

func _on_game_timer_game_timer_end(secondsLeft):
	$FinishText.show()
	$FinishSFX.play()
	await get_tree().create_timer(1).timeout
	$FinishText.hide()
	
	Global.PACKING_TIME_TAKEN = GAME_TIME - secondsLeft
	Global.PACKING_MISTAKES = mistakes
	
	if (secondsLeft > 0 && mistakes == 0):
		Global.PACKING_MEDAL = "Gold"
	elif (secondsLeft > 0 && mistakes <= 3):
		Global.PACKING_MEDAL = "Silver"
	else:
		Global.PACKING_MEDAL = "Bronze"
	
	Global.NEXT_GAME_SCENE = "res://scenes/shipping.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
