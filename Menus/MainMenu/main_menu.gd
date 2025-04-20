extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")



func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/LevelsMenu/LevelsMenu.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/SettingsMenu/SettingsMenu.tscn")
	


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/CreditsMenu/CreditsMenu.tscn")



func _on_blue_moon_creations_pressed() -> void:
	OS.shell_open("https://www.bluemooncreates.com")

	
	
func _on_quit_pressed() -> void:
	get_tree().quit()
