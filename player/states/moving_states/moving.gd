extends MovingState

@export
var attack_state: State

func enter():
    super()

func exit():
    pass

func process_input(_event: InputEvent) -> State:
    if Input.is_action_pressed("sprint"):
        return sprinting_state

    return
