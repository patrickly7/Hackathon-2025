extends Node2D

const GAME_TIME = 15
const MOVEMENT = 200
var FRONT_SPRITE = load("res://assets/art/Stick_Figure_Front.png")
var BACK_SPRITE = load("res://assets/art/Stick_Figure_Back.png")

var startingPos = Vector2.ZERO

var isTouchingBox = false
var currentBox: Area2D

func _ready():	
	startingPos = $PlayerBody.position
	$GameTimer.startTimer(GAME_TIME)
	
	$TopBoxSpawner.startSpawning(1)
	$BottomBoxSpawner.startSpawning()
	
func _input(event):
	if event.is_action_pressed("move_up") && $PlayerBody.position.y != startingPos.y - MOVEMENT:
		$PlayerBody.position.y -= MOVEMENT
		$PlayerBody/Player.texture = BACK_SPRITE
	elif event.is_action_pressed("move_down") && $PlayerBody.position.y != startingPos.y:
		$PlayerBody.position.y += MOVEMENT
		$PlayerBody/Player.texture = FRONT_SPRITE
	elif event.is_action_pressed("action") && isTouchingBox && currentBox != null:
		currentBox.queue_free()

func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/confirm_receive.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")

func _on_player_body_area_entered(area):
	if area.is_in_group("box"):
		isTouchingBox = true
		currentBox = area

func _on_player_body_area_exited(area):
	if area.is_in_group("box"):
		isTouchingBox = false
		currentBox = null
