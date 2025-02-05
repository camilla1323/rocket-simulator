extends CanvasLayer
signal start_game


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass


func _on_startknap_pressed():
	#$Startknap.hide()
	#start_game.emit()
	print("Info button was pressed!")  # Debugging message
	get_tree().change_scene_to_file("res://main.tscn")

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Rocket Simulator"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$Startknap.show()

func update_score(score):
	$Highscore.text = str(score)
	
	
	


func _on_infoknap_pressed() -> void:
	print("Info button was pressed!")  # Debugging message
	get_tree().change_scene_to_file("res://infoskærm.tscn")
