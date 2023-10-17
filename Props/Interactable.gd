extends Area2D

class_name Interactable

@export var dialogue: String = "Heyyyy I got touched"
@export var interactable_type = InteractableType.BED

var is_interacted = false

# Enum for Interactable Type
enum InteractableType {
    BED,
    CAT,
    DISH,
}

func _ready():
    $InteractKey.modulate.a = 0

func can_interact():
    if is_interacted == false:
        is_interacted = true
        create_tween().tween_property($InteractKey, "modulate:a", 1, 0.15).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
        create_tween().tween_property($InteractKey, "position", $InteractKeyEndPos.position, 0.15).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

func interacted():
    if is_interacted == true:
        var orig_scale = $InteractKey.scale
        create_tween().tween_property($InteractKey, "scale", orig_scale * 1.2, 0.05).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
        create_tween().tween_property($InteractKey, "scale", orig_scale, 0.05).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT).set_delay(0.15)

        #If we interact with a dish, we'll remove it from the scene
        if interactable_type == InteractableType.DISH:
            $InteractKey.get_parent().get_parent().queue_free();

func stop_interact():
    if is_interacted == true:
        is_interacted = false
        create_tween().tween_property($InteractKey, "modulate:a", 0, 0.05).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
        create_tween().tween_property($InteractKey, "position", $InteractKeyStartPos.position, 0.05).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
