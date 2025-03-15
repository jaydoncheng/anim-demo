extends Node

@export
var starting_state: State

@export
var debug_label: Label

var current_state
func _ready():
    change_state(starting_state)

func change_state(new_state: State):
    if current_state:
        current_state.exit()

    current_state = new_state
    current_state.enter()
    print(current_state)
    debug_label.text = current_state.to_string()

func process_input(event: InputEvent):
    var new_state = current_state.process_input(event)
    if new_state:
        change_state(new_state)

func process_physics(delta: float):
    var new_state = current_state.process_physics(delta)
    if new_state:
        change_state(new_state)

func process_frame(delta: float):
    var new_state = current_state.process_frame(delta)
    if new_state:
        change_state(new_state)
