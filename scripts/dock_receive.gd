extends Node2D

const GAME_TIME = 10
const MOVEMENT = 200
var FRONT_SPRITE = load("res://assets/art/Stick_Figure_Front.png")
var BACK_SPRITE = load("res://assets/art/Stick_Figure_Back.png")

var startingPos = Vector2.ZERO

func _ready():
	startingPos = $Player.position
	$GameTimer.startTimer(GAME_TIME)

func _input(event):
	if event.is_action_pressed("move_left") && $Player.position.x != startingPos.x - MOVEMENT:
		$Player.position.x -= MOVEMENT
	elif event.is_action_pressed("move_right") && $Player.position.x != startingPos.x + MOVEMENT:
		$Player.position.x += MOVEMENT
	elif event.is_action_pressed("move_up") && $Player.position.y != startingPos.y - MOVEMENT:
		$Player.position.y -= MOVEMENT
		$Player.texture = BACK_SPRITE
	elif event.is_action_pressed("move_down") && $Player.position.y != startingPos.y:
		$Player.position.y += MOVEMENT
		$Player.texture = FRONT_SPRITE

func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/confirm_receive.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
