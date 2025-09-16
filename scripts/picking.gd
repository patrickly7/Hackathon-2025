extends Node2D

const GAME_TIME = 10
const NUM_TASKS = 5
const ALLOWED_COLORS = ["BLACK", "WHITE", "RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"]

var currentTask = 0
var tasks = []
var mistakes = 0

func _ready():
	$StartSFX.play()
	await get_tree().create_timer(1).timeout
	
	$ReadyText.hide()
	$StartText.show()
	
	$GameTimer.startTimer(GAME_TIME)
	$BGMusic.play()
	
	# Prepare List of Cards to Pick
	for i in range(NUM_TASKS):
		var cardColor = ALLOWED_COLORS.pick_random()
		tasks.append(cardColor)
		
		var label = Label.new()
		label.text = cardColor
		label.add_theme_font_override("font", load("res://assets/fonts/Pixel Game.otf"))
		label.add_theme_font_size_override("font_size", 45)
		
		$CardTasks.add_child(label)
		
	await get_tree().create_timer(0.25).timeout
	$StartText.hide()

func moveToNextTask():
	currentTask += 1
	if (currentTask == NUM_TASKS):
		$GameTimer.stopTimer()

func _on_game_timer_game_timer_end(secondsLeft):
	$FinishText.show()
	$FinishSFX.play()
	await get_tree().create_timer(1).timeout
	$FinishText.hide()
	
	Global.PICKING_TIME_TAKEN = GAME_TIME - secondsLeft
	Global.PICKING_MISTAKES = mistakes
	
	if (secondsLeft > 0 && mistakes == 0):
		Global.PICKING_MEDAL = "Gold"
	elif (secondsLeft > 0 && mistakes <= 3):
		Global.PICKING_MEDAL = "Silver"
	else:
		Global.PICKING_MEDAL = "Bronze"
	
	Global.NEXT_GAME_SCENE = "res://scenes/packing.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")

func _on_red_cabinet_pressed():
	if (tasks[currentTask] == "RED"):
		print("RED")
		moveToNextTask()
	else:
		mistakes += 1

func _on_blue_cabinet_pressed():
	if (tasks[currentTask] == "BLUE"):
		print("BLUE")
		moveToNextTask()
	else:
		mistakes += 1
		

func _on_green_cabinet_pressed():
	if (tasks[currentTask] == "GREEN"):
		print("GREEN")
		moveToNextTask()
	else:
		mistakes += 1

func _on_yellow_cabinet_pressed():
	if (tasks[currentTask] == "YELLOW"):
		print("YELLOW")
		moveToNextTask()
	else:
		mistakes += 1

func _on_orange_cabinet_pressed():
	if (tasks[currentTask] == "ORANGE"):
		print("ORANGE")
		moveToNextTask()
	else:
		mistakes += 1

func _on_purple_cabinet_pressed():
	if (tasks[currentTask] == "PURPLE"):
		print("PURPLE")
		moveToNextTask()
	else:
		mistakes += 1

func _on_black_cabinet_pressed():
	if (tasks[currentTask] == "BLACK"):
		print("BLACK")
		moveToNextTask()
	else:
		mistakes += 1

func _on_white_cabinet_pressed():
	if (tasks[currentTask] == "WHITE"):
		print("WHITE")
		moveToNextTask()
	else:
		mistakes += 1
