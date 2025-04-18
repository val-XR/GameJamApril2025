extends Node2D

# Whether this resource should follow the player
@export var followPlayer: bool = false

# A reference to the player node in the scene (can be assigned in editor)
@export var player: Node2D

# How quickly the resource moves toward the player
@export var follow_speed: float = 30.0

@export var minimum_distance: float = 50

# Called every physics frame (used for movement/physics updates)
func _physics_process(delta: float) -> void:
	# Only execute follow logic if the flag is enabled and player is assigned
	if followPlayer and player:
		
		minimum_distance = player.global_position.distance_to(global_position)
		
		# if object is far away
		if minimum_distance > 50:
			# Get direction from this node to the player
			#var direction = (player.global_position - global_position)
			var direction = (player.global_position - global_position).normalized()
			# Move this node toward the player at the given speed
			global_position += direction * follow_speed * delta
