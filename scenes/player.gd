extends CharacterBody2D

var is_dragging := false
var health = 100

func _ready() -> void:
	$OxygenTimer.NoAir.connect(No_Air)

func No_Air():
	if health <= 0:
		pass
	else:
		health -= 1
		print("Health:", health)



func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_dragging = event.pressed  # true when pressed, false when released
		if event is InputEventMouseMotion and is_dragging:
			print("Dragging at: ", event.position)




# Main movement
func _process(delta: float) -> void:
	var mouse_position := get_global_mouse_position()
	
	# players position
	var current_position = position
	
	# direction from player to cursor
	var direction = mouse_position - current_position
	
	# magnitude of cursor from player
	var magnitude := direction.length()
	var clamped_magnitude = clamp(magnitude, 2, 64)

	
	
	if is_dragging == true:
		 # moves the player towards the cursor. Clamped Value. Only when dragging mouse
		velocity = direction.normalized() * clamped_magnitude  * 70 * delta
		
		# sets roattion of player to face the cursor
		#rotation = direction.angle()
		
		var target_angle = (get_global_mouse_position() - global_position).angle()
		rotation = lerp_angle(rotation, target_angle, delta * 9)  # Smooth turn

		move_and_slide()
