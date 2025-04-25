extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_button_pressed() -> void:

	# convert
	var total_value = GlobalPlayer.TotalValueGet()
	var carrying_value = GlobalPlayer.CarryingValueGet()
	
	GlobalPlayer.TotalValueSet(carrying_value + total_value)
	
	CollectedScrap.clear()
	
	# end game
	if GlobalPlayer.TotalValueGet() > 10:
		get_tree().change_scene_to_file("res://Menus/GameOverMenu/GameOver.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
