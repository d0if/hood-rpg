extends Node2D

var target_scene = ""


func _ready():
	if Global.game_first_loadin == true:
		$Player.position.x = Global.player_start_posx
		$Player.position.y = Global.player_start_posy


func _process(delta):
	change_scene()


func _on_apartment_transition_point_body_entered(body):
	if body.has_method ("player"):
		print ("dook")
		Global.transition_scene = true
		target_scene = "apartment_inside"


func _on_apartment_transition_point_body_exited(body):
	if body.has_method("player"):
		print ("pee")
		Global.transition_scene = false
		

func change_scene():
	if Global.transition_scene == true:
		print ("shart")
		if Global.current_scene == "world":
			Global.game_first_loadin = false
			Global.finish_changescenes(target_scene)
			
			


func _on_chingy_enter_body_entered(body):
	if body.has_method ("player"):
		print ("dook")
		Global.transition_scene = true
		target_scene = "Chingy"


func _on_chingy_enter_body_exited(body):
	print("TEST AGAIN!!")
	if body.has_method("player"):
		print ("pee")
		Global.transition_scene = false
