extends StaticBody2D
@export var speed: float = 100  # Standard hastighed
var direction: Vector2  # Bevægelsesretningen


func _ready() -> void:
	direction = Vector2.RIGHT.rotated(deg_to_rad(randf_range(0, 20)))  # Tilfældig vinkel mellem -15 og 15 grader
	$VisibleOnScreenNotifier2D.screen_exited.connect(queue_free)

func _process(delta: float) -> void:
	position += direction * speed * delta  # Bevægelse i den tilfældige retning
