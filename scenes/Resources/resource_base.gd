extends RigidBody2D


# Whether this resource should follow the player
@export var followPlayer: bool = false

# A reference to the player node in the scene (can be assigned in editor)
@export var player: Node2D

# How quickly the resource moves toward the player
@export var follow_speed: float = 150.0

@export var minimum_distance: float = 30



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


func _on_button_button_down() -> void:
	followPlayer = !followPlayer
	line_node.clear_points()


@export var line_node: Node2D
@export var object_a: Node2D
@export var object_b: Node2D
@export var offset = Vector2(0, -60)

func _process(delta):
	if object_a and object_b and followPlayer:
		line_node.clear_points()
		line_node.add_point((object_a.global_position) + offset)
		line_node.add_point((object_b.global_position) + offset)
		line_node.clear_points()


# clear line
func clear_line():
	line_node.clear_points()
