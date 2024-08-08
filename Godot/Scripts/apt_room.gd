extends Node2D

var target_scene = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	print (Global.current_scene + "retard")



func _process(delta):
	change_scenes()


func _on_apt_room_exit_body_entered(body):
	if body.has_method("player"):
		print ("fart")
		Global.transition_scene = true
		target_scene = "apartment_inside"


func _on_apt_room_exit_body_exited(body):
	if body.has_method("player"):
		print ("shit")
		Global.transition_scene = false

func change_scenes():
	if Global.transition_scene == true:
		print ("poop")
		if Global.current_scene == "apt_room":
			Global.finish_changescenes(target_scene)
