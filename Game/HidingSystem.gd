extends Node2D

var hiding_spots = []
var current_hiding_spot

signal print_dialogue

func _ready():
    sb.add_emitter("print_dialogue", self)
    findInteractables(get_parent(), hiding_spots)
    choose_hiding_spot()
    pass
    
func findInteractables(node: Node, result : Array) -> void:
  if node is Interactable and node.is_hiding_spot:
    result.push_back(node)
  for child in node.get_children():
    findInteractables(child, result)

func remove_non_interactables(node):
    return node is Interactable

func choose_hiding_spot():
    var next_possible_hiding_spots = hiding_spots.duplicate()
    next_possible_hiding_spots.erase(current_hiding_spot)
    current_hiding_spot = next_possible_hiding_spots[randi_range(0, next_possible_hiding_spots.size())-1]

func check_hiding_spot(interactable):
    print("Interacted w hiding spot")
    if interactable is Interactable and interactable.is_hiding_spot:
        if interactable == current_hiding_spot:
            choose_hiding_spot()
            extract_cat(current_hiding_spot)
        else:
            # Interesting possible use case for the global event bus for pushing messages to the dialogue box
            emit_signal("print_dialogue", "(Whoopsie, no cat here!)")
    pass

func extract_cat(next_hiding_spot):
    # emit a signal for the cat to pick up
    emit_signal("print_dialogue", "(Cat is on the move to the next destination)")
    pass
