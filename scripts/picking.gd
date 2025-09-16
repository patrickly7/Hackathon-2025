extends Node2D

const GAME_TIME = 10
const NUM_TASKS = 5
const ALLOWED_COLORS = ["BLACK", "WHITE", "RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"]

var currentTask = 0

func _ready():
	$GameTimer.startTimer(GAME_TIME)
	
	# Prepare List of Cards to Pick
	for i in range(NUM_TASKS):
		var cardColor = ALLOWED_COLORS.pick_random()
		
		var label = Label.new()
		label.text = cardColor
		label.add_theme_font_override("font", load("res://assets/fonts/Pixel Game.otf"))
		label.add_theme_font_size_override("font_size", 45)
		
		$CardTasks.add_child(label)

func _on_game_timer_game_timer_end(secondsLeft):
	Global.NEXT_GAME_SCENE = "res://scenes/packing.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")

func _on_red_cabinet_pressed():
	print("red")
	pass # Replace with function body.

func _on_blue_cabinet_pressed():
	print("blue")
	pass # Replace with function body.

func _on_green_cabinet_pressed():
	print("green")
	pass # Replace with function body.

func _on_yellow_cabinet_pressed():
	print("yellow")
	pass # Replace with function body.

func _on_orange_cabinet_pressed():
	print("orange")
	pass # Replace with function body.

func _on_purple_cabinet_pressed():
	print("purple")
	pass # Replace with function body.

func _on_black_cabinet_pressed():
	print("black")
	pass # Replace with function body.

func _on_white_cabinet_pressed():
	print("white")
	pass # Replace with function body.
