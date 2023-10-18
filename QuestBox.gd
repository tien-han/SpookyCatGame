extends PanelContainer

#Keep a list of all quests that can populate in the QuestBox
var quest_list = ["Do dishes", "Make bed", "Pet cat"];

var quest_text = "Do dishes"
var quest_condition_text = " dishes"
var total_dishes = 6
var current_dishes = 0
var questNum = 0

func _ready():
    $Dialogue.text = quest_text

func update_quest_item(interactable):
    var is_dish_type = interactable.interactable_type == Interactable.InteractableType.DISH
    var is_bed_type = interactable.interactable_type == Interactable.InteractableType.BED

    $Dialogue.text = quest_text

    #Handle quest notice for interacting with dishes
    if quest_text == "Do dishes" && is_dish_type:
        if current_dishes < total_dishes:
            current_dishes += 1
            $Dialogue.text = "%s: %s/%s %s" % [quest_text, current_dishes, total_dishes, quest_condition_text]
            if current_dishes == total_dishes:
                questNum += 1
                quest_text = quest_list[questNum]
                $Dialogue.text = "Next: " + quest_text
                is_dish_type = false
    #Handle quest notice for interacting with beds
    elif quest_text == "Make bed" && is_bed_type:
        questNum += 1
        quest_text = quest_list[questNum]
        $Dialogue.text = "Bed has been made!\nNext: %s" % [quest_text]
