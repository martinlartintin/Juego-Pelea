extends CharacterBody2D

var velocidad : int = 150
var salto : int = 200
var gravedad : int = 100
@onready var Animated_Sprite = $Sprite


func _physics_process(delta):
	
	update_animations()
	
	velocity.y += gravedad * delta
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = velocidad
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -velocidad
		$Sprite.flip_h = true
	else:
		velocity.x = 0
	move_and_slide()
	
func update_animations():
	if velocity.x: 
		Animated_Sprite.play("walk")
	else:
		Animated_Sprite.play("idle")
