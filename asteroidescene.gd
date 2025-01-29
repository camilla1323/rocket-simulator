extends Node2D
@export var asteroid_scene: PackedScene  # Vælg asteroide-scenen i Inspector
@export var min_speed: float = 120
@export var max_speed: float = 200
var max_asteroids = 4  # Maksimum antal asteroider på skærmen



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(spawn_asteroid)  # Forbinder timerens signal


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_asteroid() -> void:
	
	if get_tree().get_nodes_in_group("asteroids").size() >= max_asteroids:
		return  # Stop med at spawne, hvis der er for mange

	var asteroid = asteroid_scene.instantiate()
	asteroid.add_to_group("asteroids")  # Tilføj til gruppe for at tracke dem
	
	# Opret en PathFollow2D som parent
	var path_follow = PathFollow2D.new()
	path_follow.progress = randf_range(0, $Path2D.curve.get_baked_length())
	#path_follow.progress_ratio = randf()  # Tilfældig placering på stien

	path_follow.add_child(asteroid)
	$Path2D.add_child(path_follow)

	# Sæt en tilfældig hastighed
	asteroid.speed = randf_range(min_speed, max_speed)
