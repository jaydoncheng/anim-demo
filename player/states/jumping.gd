extends State

@export
var JUMP_VELOCITY = 10

@export
var idle_state: State

# Must always start with super()
func enter():
    super()
    parent.velocity.y = JUMP_VELOCITY 

func exit():
    pass

# Returning null retains this state
func process_input(event: InputEvent) -> State:
    return

func process_physics(delta) -> State:
    parent.velocity += parent.get_gravity() * delta
    parent.move_and_slide()

    # if falling state is needed
    # if parent.velocity.y < 0:
    #     return falling_state

    if parent.is_on_floor():
        return idle_state

    return
