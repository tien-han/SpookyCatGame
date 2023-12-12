extends PanelContainer

var queued_text = []
var text_to_print = ""
var text_index = 0
var text_printed = ""

func _ready():
    sb.add_listener("print_dialogue", self, "on_print_dialogue")
    visible = false

func _process(delta):
    $QueueIndicator.visible = queued_text.size() > 0

func on_print_dialogue(dialogue):
    if text_to_print == text_printed:
        set_new_text(dialogue)
    else:
        queued_text.append(dialogue)

func set_new_text(text):
    text_to_print = text
    text_printed = text_to_print[0]
    text_index = 1
    self.visible = true
    $VisibilityTimer.start()
    $PrintingTimer.start()

func _on_timer_timeout():
    $Dialogue.text = ""
    if queued_text.size() == 0:
        self.visible = false
    else:
        var next_in_line = queued_text.pop_front()
        set_new_text(next_in_line)

func _on_printing_timer_timeout():
    if text_to_print == text_printed:
        $PrintingTimer.stop()
    else:
        text_printed += text_to_print[text_index]
        text_index += 1
        $Dialogue.text = text_printed
