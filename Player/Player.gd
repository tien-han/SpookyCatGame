extends CharacterBody2D

const SPEED = 50.0
var interactables = []

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

func _on_interactor_area_entered(area):	
	interactables.append(area.get_parent())

func _on_interactor_area_exited(area):
	interactables.clear()
	
func _input(event):
	#TO-DO cover case where player has no interactables but presses e
	if event.is_action_pressed("interact_key"):
		print("Interact key was pressed")
		interact()
		
func interact():
	var closest_node = interactables[0]
	var dist_to_closest = position.distance_to(closest_node.global_position)
	for node in interactables:
		var distance = position.distance_to(node.global_position)
		if distance < dist_to_closest:
			closest_node = node
	print(closest_node.name)
		
