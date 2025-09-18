extends Node2D

var box = load("res://scenes/dock_receive_box.tscn")

func startSpawning():
	$Timer.start(3)
	
func stopSpawning():
	$Timer.stop()

func spawnBox():
	var newBox = box.instantiate()
	newBox.scale *= 1.5
	newBox.setSpeed(200)
	add_child(newBox)

func _on_timer_timeout():
	spawnBox()
