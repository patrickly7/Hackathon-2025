extends Node2D

const GAME_TIME = 10
const truckArrangement = ["Medium", "Small", "Large", "Small", "Small"]
const truckArrangements = [truckArrangement]

const activeTruckSpotSprite = "res://assets/art/Card_Black.png"
const finishedTruckSpotSprite = "res://assets/art/Card_Green.png"

var currentSpotIndex = 0
var currentTruckArrangement = []
var mistakes = 0

func _ready():
	$StartSFX.play()
	await get_tree().create_timer(1).timeout
	
	$ReadyText.hide()
	$StartText.show()
	
	currentTruckArrangement = truckArrangements.pick_random()
	$GameTimer.startTimer(GAME_TIME)
	setActiveTruckSpot()
	
	await get_tree().create_timer(0.25).timeout
	$StartText.hide()
	
func _on_game_timer_game_timer_end(secondsLeft):
	$FinishText.show()
	$FinishSFX.play()
	await get_tree().create_timer(1).timeout
	$FinishText.hide()
	
	Global.SHIPPING_TIME_TAKEN = GAME_TIME - secondsLeft
	Global.SHIPPING_MISTAKES = mistakes
	
	if (secondsLeft > 0 && mistakes == 0):
		Global.SHIPPING_MEDAL = "Gold"
	elif (secondsLeft > 0 && mistakes <= 3):
		Global.SHIPPING_MEDAL = "Silver"
	else:
		Global.SHIPPING_MEDAL = "Bronze"
		
	Global.NEXT_GAME_SCENE = ""
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")

func setActiveTruckSpot():
	$TruckArrangement.get_children()[currentSpotIndex].texture_normal = load(activeTruckSpotSprite)

func updateTruckSpot():
	$TruckArrangement.get_children()[currentSpotIndex].texture_normal = load(finishedTruckSpotSprite)
	
	currentSpotIndex += 1
	if (currentSpotIndex == currentTruckArrangement.size()):
		$GameTimer.stopTimer()
	else:
		setActiveTruckSpot()

func _on_small_package_button_pressed():
	if (currentTruckArrangement[currentSpotIndex] == "Small"):
		updateTruckSpot()
	else:
		mistakes += 1

func _on_large_package_button_pressed():
	if (currentTruckArrangement[currentSpotIndex] == "Large"):
		updateTruckSpot()
	else:
		mistakes += 1

func _on_medium_package_button_pressed():
	if (currentTruckArrangement[currentSpotIndex] == "Medium"):
		updateTruckSpot()
	else:
		mistakes += 1
