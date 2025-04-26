extends Node


@export var Player: CharacterBody2D

# health vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

@onready var player_health : float = 100

# gives player health
func PlayerHealthGet():
	#print("Health Value Requested: " + str(player_health))
	return player_health

	

# change player health
func PlayerHealthAdd(amount):
	player_health += amount
	if player_health <= 0:
		get_tree().change_scene_to_file("res://Menus/RestartMenu/RestartMenu.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#print("Health Value Add: " + str(player_health))


# set player health
func PlayerHealthSet(amount):
	player_health = amount
	#print("Health Value Set: " + str(player_health))




# oxygen vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

@onready var player_oxygen : float = 100

# gets player oxygen
func PlayerOxygenGet():
	#print("Oxygen Value Requested: " + str(player_oxygen))
	return player_oxygen

# change player oxygen
func PlayerOxygenAdd(amount):
	# clamps value
	player_oxygen = clamp(player_oxygen + amount, 0, 100)
	#print("Oxygen Value Add: " + str(player_oxygen))


# set player oxygen
func PlayerOxygenSet(amount):
	player_oxygen = clamp(amount, 0, 100)
	#print("Oxygen Value Set: " + str(player_oxygen))



# total value vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

@onready var total_value : float = 0

# gets total value
func TotalValueGet():
	#print("Total Value Requested: " + str(total_value))
	return total_value

# change total value
func TotalValueAdd(amount):
	total_value = total_value + amount
	#print("Total Value Added: " + str(total_value))


# set total value
func TotalValueSet(amount):
	total_value = amount
	#print("Total Value Set: " + str(total_value))



# carrying value vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

func CarryingValueGet():
	# get list of scrap from gloabl autoload
	var scrap_list = CollectedScrap.collected_scrap_list()
	
	# get resources dictionary from gloabl autoload
	var resources_dictionary = ResourcesDictionary.dictionary()
	
	# total value
	var total_value: int = 0
	
	for node in scrap_list:
		
		# add up total value
		total_value += int(resources_dictionary[node.name]["value"])
	
	return total_value
	print("Carrying Value Requested")
