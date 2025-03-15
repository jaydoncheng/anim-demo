class_name State
extends Node

# The object which has state
@export
var object: Node

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
