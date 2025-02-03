extends Node
@export var mob_scene: PackedScene
var score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func game_over():
	pass
	
func new_game():
	score = 0
	$Raket.start($StartPosition.position)
	$Startskærm.update_score(score)
	
