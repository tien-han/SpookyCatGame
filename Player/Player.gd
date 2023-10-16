extends CharacterBody2D

signal interacted_with(interactable : Interactable)

const SPEED = 50.0
var interactables = []
var closest_interactable

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
	update_closest()

func _on_interactor_area_entered(area):
	if area is Interactable:
		interactables.append(area)
		area.can_interact()

func _on_interactor_area_exited(area):
	interactables.erase(area)
	area.stop_interact()
	
func _input(event):
	if event.is_action_pressed("interact_key"):
		if interactables.size() > 0:
			interact()
		
func interact():
	print(closest_interactable.name)
	emit_signal("interacted_with", closest_interactable)

func update_closest():
	if interactables.size() == 0:
		return
	
	if interactables.size() == 1:
		closest_interactable = interactables[0]
		return

	var closest_node = interactables[0]
	var dist_to_closest = position.distance_to(closest_node.global_position)
	for node in interactables:
		var distance = position.distance_to(node.global_position)
		if distance < dist_to_closest:
			closest_node = node
	if closest_node != closest_interactable:
		closest_node.can_interact()
		closest_interactable.stop_interact()
		closest_interactable = closest_node

