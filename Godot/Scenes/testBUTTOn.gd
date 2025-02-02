extends TextureButton

var esc_held = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		if !esc_held:
			get_tree().get_first_node_in_group("player").pause()
		esc_held = true
	else:
		esc_held = false
