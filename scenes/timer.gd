extends Timer

const MaxOxygen = 300
var Oxygen = 300
var IsMoving = false
var OldLocation: Vector2
signal NoAir
var Change = Oxygen / 10
var NextChange = Oxygen - Change
var RefillAir = Oxygen + Change

func _on_timeout() -> void:
	if Oxygen <= 0:
		emit_signal("NoAir")
	else:
		# if IsMoving is true then uses oxygen faster
		if IsMoving == true:
			Oxygen -= 1.5
			print("Oxygen:", Oxygen)
		else:
			# if IsMoving is false then uses oxygen normally
			Oxygen -= 1
			print("Oxygen:", Oxygen)

# Checks if the player is moving
func _on_old_pos_timeout() -> void:
	var player = $".."
	# if OldLocation is equal to Current location
	if OldLocation == player.global_position:
		IsMoving = false
	else:
		# if Oldlocation is not equal to new location
		IsMoving = true
		OldLocation = player.global_position
