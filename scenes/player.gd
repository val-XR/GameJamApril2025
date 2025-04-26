extends CharacterBody2D

var is_dragging := false
var health = GlobalPlayer.PlayerHealthGet()
var oxygen_decrease_rate = 0.005


func _ready() -> void:
	GlobalPlayer.PlayerHealthSet(100)
	GlobalPlayer.PlayerOxygenSet(100)



func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_dragging = event.pressed  # true when pressed, false when released
		if event is InputEventMouseMotion and is_dragging:
			#print("Dragging at: ", event.position)
			pass




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
		

		if direction.angle() > 1.5:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		
		var target_angle = (get_global_mouse_position() - global_position).angle()
		rotation = lerp_angle(rotation, target_angle, delta * 9)  # Smooth turn

		move_and_slide()
		
		GlobalPlayer.PlayerOxygenAdd(-3 * oxygen_decrease_rate)
		$AnimatedSprite2D.set_speed_scale(1.5)
	
	else:
		GlobalPlayer.PlayerOxygenAdd(-1 * oxygen_decrease_rate)
		$AnimatedSprite2D.set_speed_scale(1.0)
		
	if GlobalPlayer.PlayerOxygenGet() <= 0:
		#GlobalPlayer.PlayerHealthSet(0)
		GlobalPlayer.PlayerHealthAdd(-0.01)
		print("Out of o2")
	else:
		pass
