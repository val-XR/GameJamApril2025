extends Node

# The global list (can be strings, objects, numbers, etc.)
var item_list: Array = []

# Add an item to the list
func add_item(item_node: Node) -> void:
	if item_node not in item_list:
		item_list.append(item_node)
		print("Added:", item_node.name)
	else:
		print("Item already in list:", item_node.name)

# Remove an item from the list
func remove_item(item_node) -> void:
	if item_node in item_list:
		item_list.erase(item_node)
		print("Removed:", item_node)
	else:
		print("Item not found:", item_node.name)

# Optional: Print the full list
func print_list() -> void:
	print("Current List:", item_list)
	
	
func collected_scrap_list():
	return item_list


func clear():
	
	# get list of scrap from gloabl autoload
	var scrap_list = CollectedScrap.collected_scrap_list()
	
	# get resources dictionary from gloabl autoload
	var resources_dictionary = ResourcesDictionary.dictionary()
	
	# total value
	var total_value: int = 0
	
	for node in scrap_list:
		
		var parent_scene = node.get_parent()

		if parent_scene.has_node("Line2D"):  # Or whatever the path is
			var line_node = parent_scene.get_node("Line2D")
			line_node.queue_free()
			
			var node2 = node
			remove_item(node2)
			node2.queue_free()
		
			print("Carried Resources Cleared")
