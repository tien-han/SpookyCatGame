extends Area2D

class_name Interactable

@export var dialogue: String = "Heyyyy I got touched"

func can_interact():
	$InteractKey.visible = true
	
func stop_interact():
	$InteractKey.visible = false
