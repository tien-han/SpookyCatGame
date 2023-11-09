extends CharacterBody2D

const speed = 50

var destination: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
    var direction = to_local(nav_agent.get_next_path_position()).normalized()
    velocity = direction * speed
    move_and_slide()

func _ready():
    sb.add_listener("new_hiding_spot", self, "_on_new_hiding_spot")

func _on_new_hiding_spot(next_hiding_spot):
    print("moving to %s %s" % [next_hiding_spot.global_position, next_hiding_spot.get_parent().name])
    create_tween().tween_property($CatSprite1, "modulate:a", 1, 0.02).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
    create_tween().tween_property($CatSprite1, "modulate:a", 0, 1.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT).set_delay(0.02)
    destination = next_hiding_spot.get_parent()
    nav_agent.target_position = destination.global_position

func make_path() -> void:
    if destination != null:
        nav_agent.target_position = destination.global_position

func _on_timer_timeout():
    make_path()
