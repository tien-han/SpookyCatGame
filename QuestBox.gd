extends PanelContainer

var quest_text = "Do dishes"
var quest_condition_text = " dishes"
var total_dishes = 6
var current_dishes = 0

func _ready():
    $Dialogue.text = "%s: %s/%s %s" % [quest_text, current_dishes, total_dishes, quest_condition_text]

func update_quest_item(interactable):
    # If this type of interactable do these actions
    #increment item current_dishes
    current_dishes += 1

    $Dialogue.text = "%s: %s/%s %s" % [quest_text, current_dishes, total_dishes, quest_condition_text]
