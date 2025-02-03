extends TextureButton

@onready var sprite: AnimatedSprite2D = $"player/Camera2D/HUD/Clock"  # Adjust path if necessary
var interaction_count: int = 0
const MAX_INTERACTIONS: int = 7
var oscillating: bool = false
var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite:
		sprite.frame = 0 

func _pressed():
	print("goon")
	if oscillating:
		return 
	interaction_count += 1
	
	if interaction_count < MAX_INTERACTIONS:
		sprite.frame += 1 #move to next frame
	elif interaction_count == MAX_INTERACTIONS:
		start_oscillation()

func start_oscillation():
	oscillating = true
	tween = create_tween()
	tween.set_loops() #infinite loop
	tween.tween_property(sprite, "frame",7, 0.5).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(sprite, "frame", 8, 0.5).set_trans(Tween.TRANS_LINEAR)





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
