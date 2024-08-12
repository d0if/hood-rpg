extends TextureButton

var esc_hold_prevent = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		if !esc_hold_prevent:
			get_tree().get_first_node_in_group("player").pause()
		esc_hold_prevent = true
	else:
		esc_hold_prevent = false
