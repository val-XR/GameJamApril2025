extends CharacterBody2D

# Movement speed of the character
const speed = 20

# Flag to track whether the fish is actively chasing the player
var FishAngry = false

# Exposed variable to assign the player node in the editor
@export var player: Node2D

# Cache the NavigationAgent2D node when the scene is ready
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D


# Called every physics frame to move the fish using pathfinding
func _physics_process(delta: float) -> void:
	# Get the direction toward the next path point and normalize it
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	# Set the velocity based on the direction and speed
	velocity = direction * speed
	# Apply the movement with sliding
	move_and_slide()

# Directs the fish to move toward the player using the navigation system
func makepath() -> void:
	# Set the target position for the navigation agent to the player's position
	nav_agent.target_position = player.global_position
	# Mark the fish as angry/chasing
	FishAngry = true
	# Flip the sprite based on direction to face the player
	if nav_agent.target_position > $Sprite2D.global_position:
		$Sprite2D.flip_h = true
	elif nav_agent.target_position < $Sprite2D.global_position:
		$Sprite2D.flip_h = false

# Sends the fish to a random waypoint if not chasing the player
func fishhome() -> void:
	# List of waypoint nodes to choose from
	var waypoints = [$"../Waypoints/Waypoint", $"../Waypoints/Waypoint2", $"../Waypoints/Waypoint3",$"../Waypoints/Waypoint4" ]
	# Seed the random number generator
	randomize()
	# Pick a random waypoint from the list
	var item = waypoints[randi() % waypoints.size()]
	# Call randi again (does nothing here, may be leftover or for debugging)
	randi()
	# Print selected waypoint (for debugging)
	print(item)
	# Set the pathfinder to move toward the chosen waypoint
	nav_agent.target_position = item.global_position
	# Flip the sprite to face the direction of movement
	if nav_agent.target_position > $Sprite2D.global_position:
		$Sprite2D.flip_h = true
	elif nav_agent.target_position < $Sprite2D.global_position:
		$Sprite2D.flip_h = false

# Timer callback that updates the fish's behavior based on player's proximity
func _on_timer_timeout() -> void:
	# Measure the distance from the fish to the player
	var distance = global_position.distance_to(player.global_position)
	# If the player is within range, chase them
	if distance <= 165:
		makepath()
	else:
		# Otherwise, stop chasing
		FishAngry = false

# Another timer that triggers random wandering if the fish is not angry
func _on_timer_2_timeout() -> void:
	# If the fish is not chasing the player, send it to a random waypoint
	if FishAngry == false:
		fishhome()
