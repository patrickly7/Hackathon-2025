extends Node2D

var box = load("res://scenes/dock_receive_box.tscn")

func startSpawning(delay: float = 0.5):
	await get_tree().create_timer(delay).timeout
	$Timer.start(1)
	
func stopSpawning():
	$Timer.stop()

func spawnBox():
	var newBox = box.instantiate()
	newBox.setSpeed(randi_range(700, 1400))
	add_child(newBox)

func _on_timer_timeout():
	spawnBox()
