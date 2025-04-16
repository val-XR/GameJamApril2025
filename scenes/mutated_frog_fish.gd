extends CharacterBody2D

const speed = 20

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

# Pathfinder
func _physics_process(delta: float) -> void:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath()
