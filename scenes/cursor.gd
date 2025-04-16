extends Node2D

@onready var cursor: Node2D = $"."
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".global_position = get_global_mouse_position()
