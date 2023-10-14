extends CharacterBody2D


const SPEED = 300.0

# DM me for an explanation...
var stairAngleRatio = 0;

func _physics_process(delta):
	
	# Getting player inputs.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_down", "ui_up")
	
	var lastXDirection = 0;
	
	if directionY:
		velocity.y = -directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	
	if directionX:
		velocity.x = directionX * SPEED
		velocity.y += -directionX * SPEED * stairAngleRatio
		lastXDirection = directionX;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if (lastXDirection < 0):
		get_node("AnimatedSprite2D").set_flip_h(false)
	elif (lastXDirection > 0):
		get_node("AnimatedSprite2D").set_flip_h(true)
	

	move_and_slide()

func handleStairs(nodePath):
	stairAngleRatio = get_node(nodePath).get_meta("StairAngleRatio")

func _on_stair_region_body_entered(body):
	if (body.name == "Player"):
		handleStairs("/root/main/StairRegion")


func _on_stair_region_body_exited(body):
	if (body.name == "Player"):
		stairAngleRatio = 0;



func _on_stair_region_2_body_entered(body):
	if (body.name == "Player"):
		handleStairs("/root/main/StairRegion2")


func _on_stair_region_2_body_exited(body):
	if (body.name == "Player"):
		stairAngleRatio = 0;
