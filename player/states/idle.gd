extends State

@export
var jumping_state: State
@export
var falling_state: State
@export
var moving_state: State

func enter():
    super()

func process_input(_event: InputEvent) -> State:
    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    if input_dir:
        return moving_state

    if Input.is_action_pressed("jump") and parent.is_on_floor():
        return jumping_state

    return null

func process_physics(delta: float) -> State:
    parent.velocity += parent.get_gravity() * delta
    parent.move_and_slide()

    if !parent.is_on_floor():
        return falling_state

    return null
