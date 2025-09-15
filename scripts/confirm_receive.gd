extends Node2D

const GAME_TIME = 10
const NUM_TASKS = 5
const ALLOWED_COLORS = ["BLACK", "WHITE", "RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"]
const SPRITE_NAMES = ["Card_Black", "Card_White", "Card_Red", "Card_Orange", "Card_Yellow", "Card_Green", "Card_Blue", "Card_Purple"]
const CARD_POSITION = Vector2(580, 510)
const RES_FORMAT = "res://assets/art/%s.png"

var tasks = []
var cards = []
var answers = []
var labels = []
var currentTask = 0
var incorrectGuesses = 0

func _ready():
	init_game()
	$GameTimer.startTimer(GAME_TIME)
	
func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/inventory.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")


func init_game():
	for i in range(NUM_TASKS):
		var cardIndex = choose_card()
		var card = ALLOWED_COLORS[cardIndex]
		tasks.append(card)
		
		$CardTasks.add_child(create_label(card))
		
		var cardImage = SPRITE_NAMES[cardIndex]
		var isAccepted = coin_flip()
		answers.append(isAccepted)
		if !isAccepted:
			var exceptionIndex = choose_card_except(cardIndex)
			cardImage = SPRITE_NAMES[exceptionIndex]
			
		cards.append(RES_FORMAT % cardImage)
	
	print(tasks)
	print(cards)

	var texture = load(cards[currentTask])
	$Card.texture = texture

func coin_flip():
	return [true,false].pick_random()
	
func choose_card():
	return range(8).pick_random()

func choose_card_except(position: int):
	var exceptionIndex = position
	while (exceptionIndex == position):
		exceptionIndex = choose_card()
	
	return exceptionIndex
	
func set_next_card():
	if currentTask + 1 == NUM_TASKS:
		_on_game_timer_game_timer_end()
	else:
		# Change task label color
		currentTask = currentTask + 1
		var texture = load(cards[currentTask])
		$Card.texture = texture

func create_label(text: String):
	var label = Label.new()
	label.text = text
	label.add_theme_font_override("font", load("res://assets/fonts/Pixel Game.otf"))
	label.add_theme_font_size_override("font_size", 45)
	labels.append(label)
	
	return label


func _on_exceptions_box_pressed():
	if answers[currentTask] == false:
		print("Correct!")
		set_next_card()
		
	else:
		print("Wrong!")
		incorrectGuesses = incorrectGuesses + 1


func _on_accepted_box_pressed():
	if answers[currentTask] == true:
		print("Correct!")
		set_next_card()
	else:
		print("Wrong!")
		incorrectGuesses = incorrectGuesses + 1
