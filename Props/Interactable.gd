extends Area2D

class_name Interactable

@export var dialogue: String = "Heyyyy I got touched"
@export var interactable_type = "Bed"
var is_interacted = false

func _ready():
    $InteractKey.modulate.a = 0

func can_interact():
    if is_interacted == false:
        print("Can interact with %s" % self.get_parent().name)
        is_interacted = true
        create_tween().tween_property($InteractKey, "modulate:a", 1, 0.15).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
        create_tween().tween_property($InteractKey, "position", $InteractKeyEndPos.position, 0.15).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

func stop_interact():
    if is_interacted == true:
        is_interacted = false
        print("Stop interact with %s" % self.get_parent().name)
        create_tween().tween_property($InteractKey, "modulate:a", 0, 0.05).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
        create_tween().tween_property($InteractKey, "position", $InteractKeyStartPos.position, 0.05).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)


