extends PanelContainer

func print_dialogue(dialogue):
    $Dialogue.text = dialogue
    self.visible = true
    $Timer.start()

func _on_timer_timeout():
    self.visible = false
