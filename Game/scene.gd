extends Node2D

func _on_player_interacted_with(interactable):
	$Canvas/DialogueBox/Dialogue.text = interactable.dialogue
