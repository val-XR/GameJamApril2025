extends Node2D

var followPlayer: bool = false

@onready var player = %Player # player
@onready var customResource: Node2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if followPlayer == true:
		var targetPosition = player.global_posiiton
	
		# players position
		var currentPosition = position
	
		# direction from player to cursor
		var direction = targetPosition - currentPosition
		var newPosition = direction + currentPosition
		customResource.global_position = newPosition
