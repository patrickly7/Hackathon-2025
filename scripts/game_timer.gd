extends Control

var timer = 0
signal game_timer_end(secondsLeft: int)

func startTimer(seconds: int):
	timer = seconds
	print("Timer Started with %s" % str(timer))
	$Timer.start()

func stopTimer(seconds: int):
	$Timer.stop()
	print("Timer Stopped at %s" % str(timer))
	game_timer_end.emit(timer)

func _on_timer_timeout():
	timer -= 1
	print("Time Remaining: %s" % str(timer))
	
	if (timer <= 0):
		$Timer.stop()
		game_timer_end.emit(timer)
