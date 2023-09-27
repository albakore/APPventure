extends CharacterBody2D


@export var SPEED = 50.0
@export var smooth = 0.2
@onready var animation = $AnimatedSprite2D


func _physics_process(delta):
	# Entradas
	var direction = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	
	if direction:
		velocity =  lerp(velocity,direction * SPEED,smooth)
		animation.flip_h = direction.x -1
		animation.play('Run')
	else:
		velocity = lerp(velocity,Vector2.ZERO,smooth)
		animation.play("Idle")

	velocity.normalized()
	move_and_slide()
