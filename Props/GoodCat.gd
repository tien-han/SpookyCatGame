extends Node2D

@onready var animationTree = $AnimationTree
@onready var animationState: AnimationNodeStateMachinePlayback = animationTree.get("parameters/playback")

func _ready():
    animationState.travel("InBoxLow")

func _on_interactable_interacted_with():
    animationState.travel("HopOutIn")
    
