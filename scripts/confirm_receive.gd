extends Node2D

const GAME_TIME = 10
const NUM_TASKS = 5
const ALLOWED_COLORS = ["BLACK", "WHITE", "RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"]
const SPRITE_NAMES = ["Card_Black", "Card_White", "Card_Red", "Card_Orange", "Card_Yellow", "Card_Green", "Card_Blue", "Card_Purple"]
const CARD_POSITION = Vector2(580, 510)
const OFF_SCREEN_POSITION = Vector2(580, 885)
const RES_FORMAT = "res://assets/art/%s.png"

var tasks = []
var cards = []
var answers = []
var labels = []
var currentTask = 0
var incorrectGuesses = 0
var babaIsWin = false

func _ready():
	$StartSFX.play()
	await get_tree().create_timer(1).timeout
	
	$ReadyText.hide()
	$StartText.show()
	
	init_game()
	$Card.show()
	$GameTimer.startTimer(GAME_TIME)
	$BGMusic.play()

	await get_tree().create_timer(0.25).timeout
	$StartText.hide()
	
	$Checklist.show()
	$CurrentCardTask.show()

func init_game():
	Global.CURRENT_GAME = "Confirm Receive"
	
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

	$CurrentCardTask.text = tasks[currentTask]

	var texture = load(cards[currentTask])
	$Card.texture = texture

func coin_flip():
	return [true,false].pick_random()
	
func choose_card():
	return range(8).pick_random()

func choose_card_except(cardIndex: int):
	var exceptionIndex = cardIndex
	while (exceptionIndex == cardIndex):
		exceptionIndex = choose_card()
	
	return exceptionIndex
	
func set_next_card():
	$Checkmark.show()
	await get_tree().create_timer(0.2).timeout
	
	if currentTask + 1 == NUM_TASKS:
		confirm_label_text(currentTask)
		babaIsWin = true
		$GameTimer.stopTimer()
	else:
		confirm_label_text(currentTask)
		currentTask = currentTask + 1
		
		$CurrentCardTask.text = tasks[currentTask]
		
		$Card.position = OFF_SCREEN_POSITION
		var texture = load(cards[currentTask])
		$Card.texture = texture
		var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_ELASTIC)
		tween.tween_property($Card, "position", CARD_POSITION, 0.5)
		
		$Checkmark.hide()

func create_label(text: String):
	var label = Label.new()
	label.text = text
	label.add_theme_font_override("font", load("res://assets/fonts/Pixel Game.otf"))
	label.add_theme_font_size_override("font_size", 45)
	labels.append(label)
	
	return label
	
func confirm_label_text(task: int):
	var label = labels[task] as Label
	label.text = "CONFIRMED!"
	
func calculate_medal():
	if babaIsWin and incorrectGuesses == 0:
		return "Gold"
	if babaIsWin and incorrectGuesses > 0:
		return "Silver"
	return ""


func _on_exceptions_box_pressed():
	if answers[currentTask] == false:
		$Correct.play()
		set_next_card()
		
	else:
		$Rong.play()
		incorrectGuesses = incorrectGuesses + 1


func _on_accepted_box_pressed():
	if answers[currentTask] == true:
		$Correct.play()
		set_next_card()
	else:
		$Rong.play()
		incorrectGuesses = incorrectGuesses + 1


func _on_game_timer_game_timer_end(secondsLeft: int):
	$FinishText.show()
	$FinishSFX.play()
	await get_tree().create_timer(1).timeout
	$FinishText.hide()
	
	Global.CONFIRM_RECEIVE_TIME_TAKEN = GAME_TIME - secondsLeft
	Global.CONFIRM_RECEIVE_MISTAKES = incorrectGuesses
	Global.CONFIRM_RECEIVE_MEDAL = calculate_medal()
	Global.NEXT_GAME_SCENE = "res://scenes/inventory.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
