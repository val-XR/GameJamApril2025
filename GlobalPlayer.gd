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



@onready var oxygen : float = 100

# gives player health
func PlayerOxygenGet():
	return player_health
	print("Health Value Requested: " + str(player_health))
	

# change player health
func PlayerOxygenAdd(amount):
	player_health += amount
	print("Health Value Add: " + str(player_health))


# set player health
func PlayerOxygenSet(amount):
	player_health = amount
	print("Health Value Set: " + str(player_health))
