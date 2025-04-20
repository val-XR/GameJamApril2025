extends CanvasLayer

@export var ambience_slider : Slider
@export var ambience_label : Label



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/MainMenu/MainMenu.tscn")



func _ready() -> void:
	## set ambience bus. Converts 1.5 to db. (16.4 db)
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Ambience"), linear_to_db(1.5 / 10.0))
	#ambience_slider.value = 1.5
	pass

#Ambience Slider
func _on_ambience_slider_value_changed(value: float) -> void:
	var bus_name = "Ambience"
	var bus_index = AudioServer.get_bus_index(bus_name)

	# Convert 0–10 slider to dB (-80 to 0)
	var db = linear_to_db(value / 10.0)  # Normalize first (0–1), then convert
	print("Ambience db set to: " + str(db))

	# Apply volume and mute if it's too low
	AudioServer.set_bus_volume_db(bus_index, db)
	AudioServer.set_bus_mute(bus_index, value <= 0.01)
	ambience_label.text = str(value)
