extends Node


var current_scene = "world" #world Apartment_inside
var paired_door = ""
var transition_scene = false

var paused = false
#var transition_cooldown = 0

#var player_start_posx = 220
#var player_start_posy = 119
#var player_pos
#var Player


#var pos_history = {"world":Vector2(player_start_posx, player_start_posy)}

#func pos_rem():
#	pos_history[current_scene] = player_pos

#hi josh, earth to josh, hello? anybody home?

#var game_first_loadin = true

func finish_changescenes(new_scene):
	transition_scene = false
	current_scene = new_scene
	get_tree().change_scene_to_file("res://Scenes/" + new_scene + ".tscn")

func split_vector_into_eight_directions(input_vector):
	var output_string
	var walk_angle = rad_to_deg(input_vector.angle())
	if (-22.5) < walk_angle && walk_angle <= (22.5):
		output_string = "right"
	elif (22.5) < walk_angle && walk_angle <= (67.5):
		output_string = "up_right"
	elif (67.5) < walk_angle && walk_angle <= (112.5):
		output_string = "up"
	elif (112.5) < walk_angle && walk_angle <= (157.5):
		output_string = "up_left"
	elif (157.5) < walk_angle && walk_angle <= (180):
		output_string = "left"
	elif (-180) <= walk_angle && walk_angle <= (-157.5):
		output_string = "left" #there are two lefts because the angle flips sign from 180 to -180
	elif (-157.5) < walk_angle && walk_angle <= (-112.5):
		output_string = "down_left"
	elif (-112.5) < walk_angle && walk_angle <= (-67.5):
		output_string = "down"
	elif (-67.5) < walk_angle && walk_angle <= (-22.5):
		output_string = "down_right"
	
	return output_string
