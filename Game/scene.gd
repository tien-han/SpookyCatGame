extends Node2D

func _on_player_interacted_with(interactable):
    $Canvas/DialogueBox.print_dialogue(interactable.dialogue)
    $Canvas/QuestBox.update_quest_item(interactable)
    $HidingSystem.check_hiding_spot(interactable)
