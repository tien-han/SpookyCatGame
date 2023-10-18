extends PanelContainer

var text_to_print = ""
var text_index = 0
var text_printed = ""

func _ready():
    sb.add_listener("print_dialogue", self, "on_print_dialogue")

func on_print_dialogue(dialogue):
    text_to_print = dialogue
    text_printed = text_to_print[0]
    text_index = 1
    self.visible = true
    $VisibilityTimer.start()
    $PrintingTimer.start()

func _on_timer_timeout():
    self.visible = false
    $Dialogue.text = ""

func _on_printing_timer_timeout():
    if text_to_print == text_printed:
        $PrintingTimer.stop()
    else:
        text_printed += text_to_print[text_index]
        text_index += 1
        $Dialogue.text = text_printed
