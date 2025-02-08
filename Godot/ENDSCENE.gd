extends TextureButton

var target_scene = "res://Scenes/stats_screen.tscn"

func _ready():
	pass


func _process(delta):
	change_scenes()
	pass

func _on_pressed():
	Global.transition_scene = true
	target_scene = self.get_meta("target")


func change_scenes():
	Global.finish_changescenes(target_scene)
