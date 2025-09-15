extends Node

const GAME_TIME = 10
var rng = RandomNumberGenerator.new()
var shelf = 1
var quantity = 0

func _ready():
	rng.randomize()
	openShelf()
	$GameTimer.startTimer(GAME_TIME)
	$CardQuantityInput.value_changed.connect(on_spin_box_value_changed)


func on_spin_box_value_changed(new_value):
	print("SpinBox value changed to: ", new_value)
	shelf +=1
	openShelf()

func _on_game_timer_game_timer_end():
	Global.NEXT_GAME_SCENE = "res://scenes/final_results_screen.tscn"
	get_tree().change_scene_to_file("res://scenes/result_screen.tscn")

	
func openShelf():
	match shelf:
		1:
			quantity = rng.randi_range(1,5)
			$Drawer1.show()
			for i in quantity:
				$Drawer1.get_child(i).show()
			
		2:
			quantity = rng.randi_range(1,5)
			$Drawer1.hide()
			$Drawer2.show()
			for i in quantity:
				$Drawer2.get_child(i).show()
		3:
			quantity = rng.randi_range(1,5)
			$Drawer2.hide()
			$Drawer3.show()
			for i in quantity:
				$Drawer3.get_child(i).show()
		4:
			quantity = rng.randi_range(1,5)
			$Drawer3.hide()
			$Drawer4.show()
			for i in quantity:
				$Drawer4.get_child(i).show()
		5:
			quantity = rng.randi_range(1,5)
			$Drawer4.hide()
			$Drawer5.show()
			for i in quantity:
				$Drawer5.get_child(i).show()
		6:
			quantity = rng.randi_range(1,5)
			$Drawer5.hide()
			$Drawer6.show()
			for i in quantity:
				$Drawer6.get_child(i).show()
			
#func showCards(num):
	
