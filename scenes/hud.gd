extends CanvasLayer


# assign total value label
@export var carrying_value_label : Label

# assign total deposited value label
@export var total_deposited_value_label : Label

# health bar sprite
@export var healthbar : AnimatedSprite2D

# oxygen bar sprite
@export var oxygen_bar : AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	# set label to deposited total value
	carrying_value_label.text = "$" +str(GlobalPlayer.CarryingValueGet())
	
	# healthbar
	var health : float = GlobalPlayer.PlayerHealthGet()
	var health_frame : int = floor(health / 10)
	healthbar.frame = health_frame
	#print("Health bar frame set: " + str(frame))
	
	# oxygen bar
	var oxygen : float = GlobalPlayer.PlayerOxygenGet()
	var oxygen_frame : int = floor(oxygen / 10)
	oxygen_bar.frame = oxygen_frame
	#print("Oxygen bar frame set: " + str(oxygen_frame))
	
	# Total Value display
	var total_value : float = GlobalPlayer.TotalValueGet()
	total_deposited_value_label.text = "$" + str(int(total_value)) + "/1,000"
	#print("total value display set: " + str(total_value))
	
	

@onready var muted = false
@export var mute_button: Button

func _on_mute_pressed() -> void:
	muted = !muted
	
	if muted:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		mute_button.text = "Unmute"
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		mute_button.text = "Mute"
