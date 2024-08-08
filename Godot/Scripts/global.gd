extends Node


var current_scene = "world" #world Apartment_inside
var transition_scene = false

var player_start_posx = 220
var player_start_posy = 119
var player_pos
var Player


var pos_history = {"world":Vector2(player_start_posx, player_start_posy)}

func pos_rem():
	pos_history[current_scene] = player_pos



var game_first_loadin = true


func finish_changescenes(new_scene):
	print ("josh")
	transition_scene = false
	current_scene = new_scene
	get_tree().change_scene_to_file("res://Scenes/" + new_scene + ".tscn")

	
	
	
