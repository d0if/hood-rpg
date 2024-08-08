extends Node2D

var target_scene = ""


func _ready():
	pass



func _process(delta):
	change_scenes()


func _on_chingy_exit_body_entered(body):
	if body.has_method("player"):
		print ("fart")
		Global.transition_scene = true
		target_scene = "world"


func _on_chingy_exit_body_exited(body):
	if body.has_method("player"):
		print ("pee")
		Global.transition_scene = false

func change_scenes():
	if Global.transition_scene == true:
		print ("poop")
		if Global.current_scene == "Chingy":
			Global.finish_changescenes(target_scene)
