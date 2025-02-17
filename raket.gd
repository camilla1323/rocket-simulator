extends Area2D
@export var speed = 80
var screen_size
signal hit
var velocity: Vector2 = Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"): #Får raketten til at flyve :O
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size) #Ændre hvor langt på skærmen raketten er flyve, kig på MeCaHaAnNo spil for at ændre
	
	

func _on_body_entered(body: Node2D) -> void:
	var hmm = body.name
	if body.name == "månen":  # Tjekker om objektet har navnet "Goal"
		win()
	else:
		die()
	
	#hide() # Player disappears after being hit.
	#hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
	#print("Info button was pressed!")  # Debugging message
	#get_tree().change_scene_to_file("res://dødskærm.tscn")
	
func die():
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	print("Info button was pressed!")  # Debugging message
	get_tree().change_scene_to_file("res://dødskærm.tscn")
	
func win():
	print("Info button was pressed!")  # Debugging message
	get_tree().change_scene_to_file("res://vindeskærm.tscn")
	
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
func _physics_process(delta: float) -> void:
	velocity = velocity
