extends State

@export
var moving_state: State

@export 
var jumping_state: State

@export
var mesh_instance: MeshInstance3D


var SPEED = 10

func enter():
    super()
    mesh_instance.rotate_x(15)

func exit():
    mesh_instance.rotation.x = 0

func process_input(event: InputEvent) -> State:
    if !Input.is_action_pressed("sprint"):
        return moving_state

    if Input.is_action_pressed("jump"):
        return jumping_state

    return

func process_physics(delta) -> State:
    return moving_state.move(SPEED)
