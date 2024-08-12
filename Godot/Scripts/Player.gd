extends CharacterBody2D

const player_accel = 20.0
const player_decel = 30.0

const walk_speed = 100.0
const sprint_speed = 160.0

var current_dir = "none"

func player():
	pass

func _physics_process(delta):
	player_movement(delta)
	#current_camera()

#completely REWORKED HOORAY!!!
func player_movement(_delta):
	#handle keyboard inputs
	var sprint = false
	var moving = Vector2(0,0)

	if Input.is_key_pressed(KEY_W) or Input.is_action_pressed("ui_up"):
		moving.y -= 1
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		moving.x -= 1
	if Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down"):
		moving.y += 1
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		moving.x += 1
	
	if (abs(moving.x) + abs(moving.y)) == 2:
		moving.x *= 0.8 #way quicker than doing .normalized() IMO
		moving.y *= 0.8 #and less punishing on diagonals
	
	var pspeed = walk_speed
	if Input.is_key_pressed(KEY_SHIFT):
		pspeed = sprint_speed
		
	if moving.x != 0 and velocity.x * moving.x > 0:
		velocity.x = player_movement_approach_speed(velocity.x, pspeed * moving.x, player_accel)
	else:
		velocity.x = player_movement_approach_speed(velocity.x, pspeed * moving.x, player_decel)
	if moving.y != 0 and velocity.y * moving.y > 0:
		velocity.y = player_movement_approach_speed(velocity.y, pspeed * moving.y, player_accel)
	else:
		velocity.y = player_movement_approach_speed(velocity.y, pspeed * moving.y, player_decel)
	
	#if velocity.length() > pspeed:
		#velocity = velocity.normalized() * pspeed
			
	move_and_slide()


	
	if 0 < velocity.length() && velocity.length() <= walk_speed:
		current_dir = Global.split_vector_into_eight_directions(velocity)
		play_anim(1)
	elif walk_speed < velocity.length():
		current_dir = Global.split_vector_into_eight_directions(velocity)
		play_anim(2) #future SPRINT animation???
	else:
		current_dir = "none"
		play_anim(0)

func player_movement_approach_speed(old_speed, target_speed, accel):
	var new_speed
	if old_speed <= target_speed - (accel): #speed +++
		new_speed = old_speed + accel
	elif old_speed >= target_speed + (accel): #speed ---
		new_speed = old_speed - accel
	else: #until reached target speed, then STAY AT SPEED EXACTLY
		new_speed = target_speed
	
	return new_speed

func play_anim(movement):
	var dir = str(current_dir)
	var anim = $AnimatedSprite2D
	
	if dir.contains("left"):
		anim.flip_h = false
	else:
		anim.flip_h = false
	
	match movement:
		2:
			anim.play("sprinting")
		1:
			anim.play("walking")
		0:
			anim.play("idle")
		_:
			anim.play("idle") #play IDLE animation by default
	
	#since we use the same walking animation for all directions we don't need all this
	#if dir == "right":
		#anim.flip_h = false
		#if movement == 1:
			#anim.play ("walking")
		#elif movement == 0:
			#anim.play ("idle")
	#if dir == "left":
		#anim.flip_h = false
		#if movement == 1:
			#anim.play ("walking")
		#elif movement == 0:
			#anim.play ("idle")
	#if dir == "down":
		#anim.flip_h = false
		#if movement == 1:
			#anim.play ("walking")
		#elif movement == 0:
			#anim.play ("idle")
	#if dir == "up":
		#anim.flip_h = false
		#if movement == 1:
			#anim.play ("walking")
		#elif movement == 0:
			#anim.play ("idle")


#func current_camera():
	#if Global.current_scene == "world":
		#$Camera2D.enabled = true
		#$NEW_apt_cam.enabled = false
		#
	#elif Global.current_scene == "apartment_inside":
		#$Camera2D.enabled = false
		#$NEW_apt_cam.enabled = true

#func _process(delta):
	#Global.player_pos = position
	#Global.pos_rem()
	
func _ready():
	#if Global.current_scene in Global.pos_history:
		#position = Global.pos_history[Global.current_scene]
	pass


func pause():
	if get_tree().paused:
		get_tree().paused = false
		$Camera2D/CanvasLayer/BLUR.material.set_shader_parameter("lod", 0.0)
	else:
		get_tree().paused = true
		$Camera2D/CanvasLayer/BLUR.material.set_shader_parameter("lod", 2.2)
	pass # Replace with function body.
