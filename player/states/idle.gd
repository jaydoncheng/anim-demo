extends State

@export
var jumping_state: State
@export
var falling_state: State
@export
var moving_state: State

@export
var attack_state: State

func enter():
    super()

func process_input(_event: InputEvent) -> State:
    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    if input_dir:
        return moving_state

    if Input.is_action_pressed("jump") and object.is_on_floor():
        return jumping_state

    if Input.is_action_pressed("attack"):
        attack_state.previous_state = self
        return attack_state

    return null

func process_physics(delta: float) -> State:
    # INFO(jay): applying gravity has to be explicit in every state for movement
    # cause placing it in player.gd ends up fucking velocity calculation order.
    # this lets states specify if gravity gets applied and in what order so :shrug:
    object.velocity += object.get_gravity() * delta

    return null
