extends CharacterBody2D


const SPEED = 300.0

# TODO: make player move up as they go left while they're in a stairRegion.

func _physics_process(delta):
	
	# Getting player inputs.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_down", "ui_up")
	
	# If the user inputted a direction in the x axis [Left or Right Arrows], change velocities as such
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Same as with X but for Y.
	if directionY:
		velocity.y = -directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
