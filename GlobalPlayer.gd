extends Node


@export var Player: CharacterBody2D


@onready var player_health : float = 100

# gives player health
func PlayerHealthGet():
	return player_health
	print("Health Value Requested: " + str(player_health))
	

# change player health
func PlayerHealthAdd(amount):
	player_health += amount
	print("Health Value Add: " + str(player_health))


# set player health
func PlayerHealthSet(amount):
	player_health = amount
	print("Health Value Set: " + str(player_health))



@onready var player_oxygen : float = 100

# gives player oxygen
func PlayerOxygenGet():
	return player_oxygen
	print("Oxygen Value Requested: " + str(player_oxygen))
	

# change player oxygen
func PlayerOxygenAdd(amount):
	player_oxygen += amount
	print("Oxygen Value Add: " + str(player_oxygen))


# set player oxygen
func PlayerOxygenSet(amount):
	player_oxygen = amount
	print("Oxygen Value Set: " + str(player_oxygen))
