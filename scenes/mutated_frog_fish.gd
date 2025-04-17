extends CharacterBody2D

const speed = 20
var FishAngry = false

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D


# Pathfinder
func _physics_process(delta: float) -> void:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()

# Tells the Patherfinder the location of the player
func makepath() -> void:
	nav_agent.target_position = player.global_position
	FishAngry = true
	if nav_agent.target_position > $Sprite2D.global_position:
		$Sprite2D.flip_h = true
	elif nav_agent.target_position < $Sprite2D.global_position:
		$Sprite2D.flip_h = false
		
func fishhome() -> void:
	var waypoints = [$"../Waypoints/Waypoint", $"../Waypoints/Waypoint2", $"../Waypoints/Waypoint3",$"../Waypoints/Waypoint4" ]
	randomize()
	var item = waypoints[randi() % waypoints.size()]
	randi()
	print(item)
	nav_agent.target_position = item.global_position
	if nav_agent.target_position > $Sprite2D.global_position:
		$Sprite2D.flip_h = true
	elif nav_agent.target_position < $Sprite2D.global_position:
		$Sprite2D.flip_h = false
	
# Updates Pathfinder
func _on_timer_timeout() -> void:
	var distance = global_position.distance_to(player.global_position)
	if distance <= 165:
		makepath()
	else:
		FishAngry = false
		
func _on_timer_2_timeout() -> void:
	if FishAngry == false:
		fishhome()
