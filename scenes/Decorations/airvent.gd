extends Sprite2D

@onready var in_airvent : bool = false




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_airvent == true:
		GlobalPlayer.PlayerOxygenAdd(8 * delta)
		print("O2 increase")




func _on_area_2d_area_entered(area: Area2D) -> void:
	in_airvent = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	in_airvent = false
