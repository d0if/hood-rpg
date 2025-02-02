extends TextureButton

var i_held = false

@onready var texture_rect = $"Inventory slots" 

# Called when the node enters the scene tree for the first time.
func _ready():
	texture_rect.visible = false  # Hide it initially



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggle_texture"):  # Check for input action
		i_held = !i_held  # Toggle the state
		texture_rect.visible = i_held  # Apply visibility


func _pressed():
	i_held = !i_held  # Toggle the state
	texture_rect.visible = i_held  # Apply visibility
	print("im killing miyself")
	
