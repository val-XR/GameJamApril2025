extends CanvasLayer


# assign total value label
@export var total_value_label : Label

# health bar sprite
@export var healthbar : AnimatedSprite2D

# oxygen bar sprite
@export var oxygen_bar : AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# get list of scrap from gloabl autoload
	var scrap_list = CollectedScrap.collected_scrap_list()
	
	# get resources dictionary from gloabl autoload
	var resources_dictionary = ResourcesDictionary.dictionary()
	
	# total value
	var total_value: int = 0
	
	for node in scrap_list:
		
		# add up total value
		total_value += int(resources_dictionary[node.name]["value"])
		
	# set label to total value
	total_value_label.text = "$" + str(total_value)
	
	# healthbar
	var health : float = GlobalPlayer.PlayerHealthGet()
	var health_frame : int = floor(health / 10)
	healthbar.frame = health_frame
	#print("Health bar frame set: " + str(frame))
	
	# oxygen bar
	var oxygen : float = GlobalPlayer.PlayerOxygenGet()
	var oxygen_frame : int = floor(oxygen / 10)
	oxygen_bar.frame = oxygen_frame
	print("Oxygen bar frame set: " + str(oxygen_frame))
	
	
