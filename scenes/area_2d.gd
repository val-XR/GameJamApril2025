extends Area2D
var InArea2D = false


func _on_area_entered(area: Area2D) -> void:
	InArea2D = true

func _on_area_exited(area: Area2D) -> void:
	InArea2D = false

func _on_timer_2_timeout() -> void:
	if InArea2D:
		GlobalPlayer.PlayerHealthAdd(-2)
	
