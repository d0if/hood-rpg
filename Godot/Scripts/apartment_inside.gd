extends Node2D

var target_scene = ""

func _process(delta):
	change_scenes()
	print (Global.current_scene)


func _on_inside_apt_exit_body_entered(body):
	if body.has_method("player"):
		print ("fart")
		Global.transition_scene = true
		target_scene = "world"

func _on_inside_apt_exit_body_exited(body):
	if body.has_method("player"):
		print ("shit")
		Global.transition_scene = false
		

func change_scenes():
	if Global.transition_scene == true:
		print ("poop")
		if Global.current_scene == "apartment_inside":
			Global.finish_changescenes(target_scene)



func _on_ready():
	Global.current_scene = "apartment_inside"
	print (Global.current_scene + "goop")


func _on_apt_room_enter_body_entered(body):
	if body.has_method("player"):
		print ("fart")
		Global.transition_scene = true
		target_scene = "apt_room"
	


func _on_apt_room_enter_body_exited(body):
	if body.has_method("player"):
		print ("shit")
		Global.transition_scene = false
		
	
