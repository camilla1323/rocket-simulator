extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body.name == "Raket":  # Hvis spilleren rører "Goal"
		win()

func win():
	print("Du vandt!") 
	get_tree().change_scene_to_file("res://vindeskærm.tscn") 
	# Skift til en vinder-scene eller vis en besked
