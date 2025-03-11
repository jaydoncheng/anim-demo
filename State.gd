class_name State
extends Node

var parent
func _ready():
    parent = get_parent()

func _enter():
    pass

func _exit():
    pass

func leave():
    return parent

func _process_input(event: InputEvent) -> State:
    return

func _process_physics(delta: float) -> State:
    return

func _process_frame(delta: float) -> State:
    return
