# a base State class
class_name State
extends Node

@export
var object: Node # The object which should have this state

func _ready():
    for child in get_children():
        if child is State:
            child.object = object

func enter():
    pass

func exit():
    pass

func process_input(event: InputEvent) -> State:
    return null

func process_physics(delta: float) -> State:
    return null

func process_frame(delta: float) -> State:
    return null
