extends State

@export
var DEFAULT_JUMP_VELOCITY = 4.5

@export
var moving_state: State
@export
var attack_state: State

var jump_velocity = DEFAULT_JUMP_VELOCITY

# Must always start with super()
func enter():
    super()
    object.velocity *= 0.8
    object.velocity.y = jump_velocity

func exit():
    jump_velocity = DEFAULT_JUMP_VELOCITY
    pass

func process_input(_event: InputEvent) -> State:
    if Input.is_action_pressed("attack"):
        attack_state.previous_state = self
        return attack_state
    return

func process_physics(delta) -> State:
    object.velocity += object.get_gravity() * delta

    if object.is_on_floor():
        print("landed!")
        return moving_state

    return
