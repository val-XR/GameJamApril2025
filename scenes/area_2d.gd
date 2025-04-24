extends Area2D
var Test = false


func _on_area_entered(area: Area2D) -> void:
	GlobalPlayer.PlayerHealthAdd(-2)
	Test = true
	
func _process(delta: float) -> void:
	if Test == true:
		print(Test)
