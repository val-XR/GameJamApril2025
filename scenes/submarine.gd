extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_button_pressed() -> void:
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
	if !(total_value > 100):
		print("Not Enough Collected")
	else:
		print("Congrats!")
