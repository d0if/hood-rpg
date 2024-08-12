extends CharacterBody2D

@export var idle_animation: String = "idle" 
@onready var sprite = $AnimatedSprite2D


func _ready():
	
	if idle_animation != "":
		sprite.play(idle_animation)
		
