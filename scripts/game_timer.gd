extends Control

var totalTime = 0
var currentRotation = 0
var degreesToAdd = 0

var lockRotation = false

var timer = 0
signal game_timer_end(secondsLeft: int)

func startTimer(seconds: int):
	totalTime = seconds
	degreesToAdd = 360 / totalTime
	timer = seconds
	print("Timer Started with %s" % str(timer))
	
	$Timer.start()
	rotateTimerHand()

func stopTimer():
	$Timer.stop()
	print("Timer Stopped at %s" % str(timer))
	game_timer_end.emit(timer)

func rotateTimerHand():
	if (lockRotation):
		return
	
	if (currentRotation == 360):
		currentRotation = 0
	
	var tween = create_tween()
	tween.tween_property($RotationPoint, "rotation_degrees", currentRotation + degreesToAdd, 1)
	
	currentRotation += degreesToAdd

func _on_timer_timeout():
	timer -= 1
	print("Time Remaining: %s" % str(timer))
	
	if (timer == 3):
		$Final3SecondsSFX.play()
	
	if (timer <= 0):
		$Timer.stop()
		lockRotation = true
		game_timer_end.emit(timer)
	
	rotateTimerHand()
