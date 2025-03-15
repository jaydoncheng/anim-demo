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

# Returning null retains this state
func process_input(event: InputEvent) -> State:
    if Input.is_action_pressed("attack"):
        attack_state.previous_state = self
        return attack_state
    return

func process_physics(delta) -> State:
    object.velocity += object.get_gravity() * delta

    # if falling state is needed
    # if object.velocity.y < 0:
    #     return falling_state

    if object.is_on_floor():
        print("on floor")
        return moving_state

    return
