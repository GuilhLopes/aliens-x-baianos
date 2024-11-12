extends CharacterBody2D

@onready var animacao: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const LEFT_BOUND = 487
const RIGHT_BOUND = 670

func _physics_process(delta: float) -> void:
	# Get the input direction
	var direction := Input.get_axis("ui_left", "ui_right")

	# Update velocity based on direction, only if within boundaries
	if direction:
		velocity.x = direction * SPEED
		
		# Play animations based on direction
		if direction == 1:
			animacao.play("direita")
		elif direction == -1:
			animacao.play("esquerda")
	else:
		# Slow down if no direction input
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animacao.play("default")

	# Move the player and handle boundary clamping
	move_and_slide()

	# Keep the position within the defined boundaries
	if position.x < LEFT_BOUND:
		position.x = LEFT_BOUND
	elif position.x > RIGHT_BOUND:
		position.x = RIGHT_BOUND
