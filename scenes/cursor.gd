extends Node2D

var key: String = "" # resources disctionary key (needed to be high in scope)

@onready var cursor: Node2D = $"." # cursor var

# set ring icon vars
@onready var defaultRing: Sprite2D = $DefaultRing
@onready var animatedRing: AnimatedSprite2D = $AnimatedRing
@onready var animatedHoloUI: AnimatedSprite2D = $"Animated HoloUI"



# set resource scanner label vars
@onready var instructionLabel: Label = $InstructionLabel
@onready var resourceValueLabel: Label = $ResourceValueLabel
@onready var resourceDisplayNameLabel: Label = $ResourceDisplayNameLabel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# hide default cursort
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	setToDefaultRing()
	



func setToDefaultRing():
	
	# Set ring icon
	defaultRing.visible = true
	animatedRing.visible = false
	animatedHoloUI.visible = false
	
	# Hide resource labels
	resourceDisplayNameLabel.visible = false
	resourceValueLabel.visible = false
	instructionLabel.visible = false


func setToResourceScannerRing():
	
	# Set ring icon
	defaultRing.visible = false
	animatedRing.visible = true
	animatedHoloUI.visible = true
	
	# Enable resource labels
	resourceDisplayNameLabel.visible = true
	resourceValueLabel.visible = true
	instructionLabel.visible = true
	
	# resets and plays animation
	animatedRing.frame = 0
	animatedRing.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".global_position = get_global_mouse_position()



# resources dictionary. Referenced for resource scanner
var resources = {
	 "IronOre2":     {"display_name": "Iron Ore", "value": "50"},
	 "UraniumOre":   {"display_name": "Uranium Ore", "value": "250"},
	 "GoldOre":      {"display_name": "Gold Ore", "value": "90"},
	 "O2Tank":      {"display_name": "O2 Tank", "value": "40"},
	 "ScrapPipe":      {"display_name": "Pipe Scrap", "value": "35"},
	 "ScrapPropeller":      {"display_name": "Propeller Scrap", "value": "40"},
	}



# Area2D detected another Area2D. Checks for the name of the scene and checks the dictionary
func _on_area_2d_area_entered(area: Area2D) -> void:
	
	setToResourceScannerRing()
	
	# set key var for the disctionary and set dinctionary info to vars
	key = area.get_parent().name
	var resourceDisplayName : String = resources[key]["display_name"]
	var resourceValue : String = resources[key]["value"]
	
	# set resource scanner labels
	print("Object Detected: " + resourceDisplayName + "  Value: " + resourceValue)
	$ResourceDisplayNameLabel.text = resourceDisplayName
	$ResourceValueLabel.text = "$" + resourceValue



# Area2D leaves this Area2D
func _on_area_2d_area_exited(area: Area2D) -> void:
	if key == area.get_parent().name:
		setToDefaultRing()
		key = "" # reset key value




# mouse clicked
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if event is InputEventMouseButton and event.pressed:
				if key == "":
					print("Clicked: no key detected")
				else:
					print("Clicked: "  + key)
