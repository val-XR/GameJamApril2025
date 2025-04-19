extends RigidBody2D

# Whether this resource should follow the player
@export var followPlayer: bool = false

# A reference to the player node in the scene (can be assigned in editor)
@export var player: Node2D

# How strongly the resource is pulled toward the player
@export var follow_strength: float = 150.0

# Minimum distance before applying pull
@export var minimum_distance: float = 30.0

# Rope visuals
@export var line_node: Node2D
var object_b : Node2D = self
@export var offset = Vector2(0, -60)


func _ready():
	
	# rigid body values
	self.mass = 0.5
	self.gravity_scale = 0
	self.linear_damp = 1
	self.z_index = 0
	
	


# Called every physics frame
func _physics_process(delta: float) -> void:
	if followPlayer and player:
		var to_player = player.global_position - global_position
		var distance = to_player.length()

		if distance > minimum_distance:
			var direction = to_player.normalized()

			# Scale force down as you get closer to the player
			var strength = clamp((distance - minimum_distance), 0, 300)
			var force = direction * strength
			apply_central_force(force)
		if distance > 200:
			followPlayer = false
			line_node.clear_points()
			CollectedScrap.remove_item(self)
			
			
			
	if followPlayer == false:  # only slide if not being pulled
		apply_central_force(Vector2(0, 5))  # small downward FORCE



# Toggle follow behavior with button press
func _on_button_button_down() -> void:
	print("Clicked")
	followPlayer = !followPlayer
	line_node.clear_points()
	if followPlayer == true:
		CollectedScrap.add_item(self)
	else:
		CollectedScrap.remove_item(self)

# Draw the rope
func _process(delta: float) -> void:
	if player and object_b and followPlayer:
		line_node.clear_points()
		line_node.add_point(player.global_position + offset)
		line_node.add_point(object_b.global_position + offset)
