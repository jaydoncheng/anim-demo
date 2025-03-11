extends State

# Must always start with super()
func _enter():
    super()

func _exit():
    pass

# Returning retains this state
func _process_input(event: InputEvent) -> State:
    return

func _process_physics(delta: float) -> State:
    return

func _process_frame(delta: float) -> State:
    return
