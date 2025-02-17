extends CanvasLayer

@export var player: Area2D  # Reference til spilleren (kan sættes i Inspector)

@onready var speed_x_label = $SpeedXLabel
@onready var speed_y_label = $SpeedYLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		var velocity = player.velocity  # Forudsætter at spilleren har en "velocity" variabel
		speed_x_label.text = "Speed X: %.2f" % velocity.x
		speed_y_label.text = "Speed Y: %.2f" % velocity.y
