extends State

# Must always start with super()
func enter():
    super()

func exit():
    pass

# Returning null retains this state
func process_input(event: InputEvent) -> State:
    return

func process_physics(delta: float) -> State:
    return

func process_frame(delta: float) -> State:
    return
