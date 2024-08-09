extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	get_paired_door() # Replace with function body.


func _on_area_2d_body_exited(body):
	pass # Replace with function body.

func get_paired_door():
	var doors = get_tree().get_nodes_in_group("doors")
	for door in doors:
		
		print(door.get_meta("Pairing"))
