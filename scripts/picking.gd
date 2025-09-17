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
func confirm_label_text(task: int):
	var label = $CardTasks.get_child(task) as Label
	label.text = "Picked!"

func moveToNextTask():
	confirm_label_text(currentTask)
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
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1

func _on_blue_cabinet_pressed():
	if (tasks[currentTask] == "BLUE"):
		print("BLUE")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1
		

func _on_green_cabinet_pressed():
	if (tasks[currentTask] == "GREEN"):
		print("GREEN")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1

func _on_yellow_cabinet_pressed():
	if (tasks[currentTask] == "YELLOW"):
		print("YELLOW")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1

func _on_orange_cabinet_pressed():
	if (tasks[currentTask] == "ORANGE"):
		print("ORANGE")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1

func _on_purple_cabinet_pressed():
	if (tasks[currentTask] == "PURPLE"):
		print("PURPLE")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1

func _on_black_cabinet_pressed():
	if (tasks[currentTask] == "BLACK"):
		print("BLACK")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1

func _on_white_cabinet_pressed():
	if (tasks[currentTask] == "WHITE"):
		print("WHITE")
		$Correct.play()
		moveToNextTask()
	else:
		$Rong.play()
		mistakes += 1


func _on_red_cabinet_mouse_entered() -> void:
	$RedCabinet/DrawerRedClosed.hide()
	$RedCabinet/DrawerRedFullOpened.show()


func _on_red_cabinet_mouse_exited() -> void:
	$RedCabinet/DrawerRedClosed.show()
	$RedCabinet/DrawerRedFullOpened.hide()


func _on_blue_cabinet_mouse_entered() -> void:
	$BlueCabinet/DrawerBlueClosed.hide()
	$BlueCabinet/DrawerBlueFullOpened.show()


func _on_blue_cabinet_mouse_exited() -> void:
	$BlueCabinet/DrawerBlueClosed.show()
	$BlueCabinet/DrawerBlueFullOpened.hide()


func _on_green_cabinet_mouse_entered() -> void:
	$GreenCabinet/DrawerGreenClosed.hide()
	$GreenCabinet/DrawerGreenFullOpened.show()


func _on_green_cabinet_mouse_exited() -> void:
	$GreenCabinet/DrawerGreenClosed.show()
	$GreenCabinet/DrawerGreenFullOpened.hide()


func _on_yellow_cabinet_mouse_entered() -> void:
	$YellowCabinet/DrawerYellowClosed.hide()
	$YellowCabinet/DrawerYellowFullOpened.show()


func _on_yellow_cabinet_mouse_exited() -> void:
	$YellowCabinet/DrawerYellowClosed.show()
	$YellowCabinet/DrawerYellowFullOpened.hide()


func _on_purple_cabinet_mouse_entered() -> void:
	$PurpleCabinet/DrawerPurpleClosed.hide()
	$PurpleCabinet/DrawerPurpleFullOpened.show()


func _on_purple_cabinet_mouse_exited() -> void:
	$PurpleCabinet/DrawerPurpleClosed.show()
	$PurpleCabinet/DrawerPurpleFullOpened.hide()


func _on_black_cabinet_mouse_entered() -> void:
	$BlackCabinet/DrawerBlackClosed.hide()
	$BlackCabinet/DrawerBlackFullOpened.show()


func _on_black_cabinet_mouse_exited() -> void:
	$BlackCabinet/DrawerBlackClosed.show()
	$BlackCabinet/DrawerBlackFullOpened.hide()


func _on_white_cabinet_mouse_entered() -> void:
	$WhiteCabinet/DrawerWhiteClosed.hide()
	$WhiteCabinet/DrawerWhiteFullOpened.show()


func _on_white_cabinet_mouse_exited() -> void:
	$WhiteCabinet/DrawerWhiteClosed.show()
	$WhiteCabinet/DrawerWhiteFullOpened.hide()


func _on_orange_cabinet_mouse_entered() -> void:
	$OrangeCabinet/DrawerOrangeClosed.hide()
	$OrangeCabinet/DrawerOrangeFullOpened.show()


func _on_orange_cabinet_mouse_exited() -> void:
	$OrangeCabinet/DrawerOrangeClosed.show()
	$OrangeCabinet/DrawerOrangeFullOpened.hide()
