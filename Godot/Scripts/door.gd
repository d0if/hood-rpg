extends Node2D

var target_scene = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()
	pass


func _on_area_2d_body_entered(body):
	if not self.get_meta("Lock"):
		if body.has_method("player"):
			Global.transition_scene = true
			target_scene = self.get_meta("Target")
			Global.paired_door = self.get_meta("Pairing")
	pass


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false
	pass # Replace with function body.

func change_scenes():
	if Global.transition_scene && Global.paired_door == self.get_meta("Pairing"):
		#if Global.current_scene == (somehow get current scene file name)
		var paired_door = self.get_meta("Pairing")
		Global.finish_changescenes(target_scene)

func move_player_to_exit():
	var players = get_tree().get_nodes_in_group("player")
	
	if players.size() > 0:
		for possible_player in players:
			possible_player.set_global_position($"EXIT POSITION".global_position)
