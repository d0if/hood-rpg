extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	door_exit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func door_exit():
	var doors = get_tree().get_nodes_in_group("doors")
	if !doors:
		print("no doors in scene " + Global.current_scene)
	else:
		var paired_door
		for door in doors:
			if door.get_meta("Pairing") == Global.paired_door:
				paired_door = door
				break
		if paired_door:
			paired_door.move_player_to_exit()
	
	Global.paired_door = ""
	
