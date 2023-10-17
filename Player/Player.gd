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

func _on_interactor_area_exited(area):
    if area is Interactable:
        interactables.erase(area)
        area.stop_interact()

func _input(event):
    if event.is_action_pressed("interact_key"):
        if interactables.size() > 0:
            interact()

func interact():
    closest_interactable.interacted()
    emit_signal("interacted_with", closest_interactable)

func sort_by_distance(a, b):
    var a_dist = position.distance_to(a.global_position)
    var b_dist = position.distance_to(b.global_position)
    return a_dist < b_dist

func update_closest():
    if interactables.size() == 0:
        return

    interactables.sort_custom(sort_by_distance)

    closest_interactable = interactables[0]
    interactables[0].can_interact()

    var not_closest = interactables.slice(1)
    for interactable in not_closest:
        interactable.stop_interact()
