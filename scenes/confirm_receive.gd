extends Node2D

const GAME_TIME = 10
const ALLOWED_COLORS = ["BLACK", "WHITE", "RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"]
const SPRITE_NAMES = ["Card_Black", "Card_White", "Card_Red", "Card_Orange", "Card_Yellow", "Card_Green", "Card_Blue", "Card_Purple"]

var currentCard

func _ready():
	$GameTimer.startTimer(GAME_TIME)
