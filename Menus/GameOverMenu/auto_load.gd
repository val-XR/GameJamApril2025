extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## set ambience bus. Converts 1.5 to db. (16.4 db)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Ambience"), linear_to_db(1.5 / 10.0))
	pass
