extends Timer

var Oxygen = 300
var IsMoving = false
var OldLocation: Vector2 # <-- declare here!


func _on_timeout() -> void:
	if Oxygen <= 0:
		pass # will do later
	else:
		if IsMoving:
			Oxygen -= 2
		else:
			Oxygen -= 1
		print(Oxygen)

func _on_old_pos_timeout() -> void:
	if OldLocation == %Player.global_position:
		IsMoving = false
	else:
		IsMoving = true

	OldLocation = %Player.global_position
