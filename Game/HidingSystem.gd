extends Node2D

var hiding_spots = []
var current_hiding_spot
@onready var sound_player = $AudioStreamPlayer2D

signal print_dialogue
signal new_hiding_spot(interactable: Interactable)

func _ready():
    sb.add_emitter("print_dialogue", self)
    sb.add_emitter("new_hiding_spot", self)
    findInteractables(get_parent(), hiding_spots)
    choose_hiding_spot()
    
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
    emit_signal("new_hiding_spot", current_hiding_spot)

func check_hiding_spot(interactable):
    if interactable is Interactable and interactable.is_hiding_spot:
        if interactable == current_hiding_spot:
            choose_hiding_spot()
            sound_player.play()
            print("Found cat")
            emit_signal("print_dialogue", "(Cat is on the move to the next destination)")
            emit_signal("new_hiding_spot", current_hiding_spot)
        else:
            print("no cat")
            emit_signal("print_dialogue", "(Whoopsie, no cat here!)")
    
