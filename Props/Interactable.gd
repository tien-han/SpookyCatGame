extends Area2D

class_name Interactable

@export var dialogue: String = "Heyyyy I got touched"


@export var interactable_type = "Bed"

func can_interact():
	$InteractKey.visible = true
	
func stop_interact():
	$InteractKey.visible = false


