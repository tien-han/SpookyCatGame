extends CharacterBody2D


const SPEED = 50.0


func _physics_process(delta):


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var lr_direction = Input.get_axis("ui_left", "ui_right")
	
	if lr_direction:
		velocity.x = lr_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var ud_direction = Input.get_axis("ui_up", "ui_down")
	
	if ud_direction:
		velocity.y = ud_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
