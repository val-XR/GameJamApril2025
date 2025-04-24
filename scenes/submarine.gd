extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_button_pressed() -> void:

	# convert
	var total_value = GlobalPlayer.TotalValueGet()
	var carrying_value = GlobalPlayer.CarryingValueGet()
	
	GlobalPlayer.TotalValueAdd(carrying_value)
