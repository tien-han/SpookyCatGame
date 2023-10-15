extends CharacterBody2D

const SPEED = 50.0
var interactable = []

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
	interactable.append(area.get_parent())

func _on_interactor_area_exited(area):
	interactable.clear()
	
func _input(event):
	#TO-DO cover case where player has no interactables but presses e
	if event.is_action_pressed("interact_key"):
		print("Interact key was pressed")
		interact_with_object(interactable[0])
		
func interact_with_object(interactable_object):
	print(interactable_object.name)
		
