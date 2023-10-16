extends Node2D

func _on_player_interacted_with(interactable):
	$Canvas/DialogueBox.print_dialogue(interactable.dialogue)
