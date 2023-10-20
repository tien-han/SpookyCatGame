extends Node2D

func _ready():
    sb.add_listener("new_hiding_spot", self, "_on_new_hiding_spot")

func _on_new_hiding_spot(next_hiding_spot):
    print("moving to %s %s" % [next_hiding_spot.global_position, next_hiding_spot.get_parent().name])
    self.global_position = next_hiding_spot.get_parent().global_position
