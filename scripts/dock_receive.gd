extends Node2D

const GAME_TIME = 10
var timer = GAME_TIME

func _ready():
	$Timer.start()
	updateTime()

func _on_timer_timeout():
	timer -= 1
	updateTime()
	
	if (timer <= 0):
		Global.NEXT_GAME_SCENE = "res://scenes/confirm_receive.tscn"
		get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
		
func updateTime():
	$Label.text = str(timer)
