extends CharacterBody2D


@export var idle_animation: String = "idle" 
@export var move_distance: float = 15.0 
@export var move_speed: float = 13.0 

@onready var sprite = $AnimatedSprite2D

var direction: int = 1 
var start_position: Vector2

func _ready():
	
	if idle_animation != "":
		sprite.play(idle_animation)

	start_position = position

func _process(delta):
	
	position.x += direction * move_speed * delta
	
	
	if abs(position.x - start_position.x) >= move_distance:
		direction *= -1
		sprite.flip_h = direction > 0
		






