extends AnimatedSprite2D

var oscillating: bool = false
var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	self.frame = Global.clock_time #run this on reload to fix weirdness when entering new scenes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.clock_time >= 7:
		Global.clock_time = 7
		if oscillating:
			return
		start_oscillation()
	else:
		if tween:
			tween.stop()
		self.frame = Global.clock_time #don't mess with the animation unless we're below 7


func start_oscillation():
	oscillating = true
	tween = create_tween()
	tween.set_loops() #infinite loop
	tween.tween_property(self, "frame", 7, 0.5).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "frame", 8, 0.5).set_trans(Tween.TRANS_LINEAR)
