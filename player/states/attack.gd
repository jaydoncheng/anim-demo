extends State

@export
var idle_state: State

var previous_state: State
var done: bool = false

# Must always start with super()
func enter():
    super()
    # object.velocity += object.global_transform.basis * Vector3(0,0,-4)
    object.velocity = object.global_transform.basis * Vector3(0,0,-20)

    done = true
    print(previous_state)

func exit():
    pass

# Returning null retains this state
func process_input(event: InputEvent) -> State:
    return

func process_physics(delta) -> State:
    object.velocity += object.get_gravity() * delta
    if done:
        return previous_state
    return

func process_frame(delta) -> State:
    return
