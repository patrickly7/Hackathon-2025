extends Node2D

var BOX_SPEED = 300
const RIGHT_BOUNDARY = 1400

func _ready():
	add_to_group("box")

func setSpeed(speed: int):
	BOX_SPEED = speed

func _process(delta):
	position.x += BOX_SPEED * delta
	
	if position.x >= RIGHT_BOUNDARY:
		Global.DOCK_RECEIVE_MISTAKES += 1
		queue_free()
