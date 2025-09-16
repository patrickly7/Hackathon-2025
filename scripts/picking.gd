extends Node2D

const GAME_TIME = 10

func _ready():
	$GameTimer.startTimer(GAME_TIME)

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
