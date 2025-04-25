extends Node

func _process(delta: float) -> void:
	var parent_scene = self.get_parent()
	if parent_scene.has_node("%Player"):  # Or whatever the path is
		if $Underwater.playing == true:
			pass
		elif parent_scene.has_node("%Player"):
			$Underwater.play()
			$"Background Music".stop()
