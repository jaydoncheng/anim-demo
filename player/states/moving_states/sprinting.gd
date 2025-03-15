extends MovingState

@export
var mesh_instance: Node3D

func enter():
    super()
    SPEED = 10
    mesh_instance.rotate_x(-deg_to_rad(25))

func exit():
    mesh_instance.rotation.x = 0
    mesh_instance.rotation.y = 0

func process_input(_event: InputEvent) -> State:
    if !Input.is_action_pressed("sprint"):
        return moving_state

    return

func process_physics(delta) -> State:
    if Input.is_action_pressed("jump"):
        jumping_state.jump_velocity = 6
        return jumping_state

    # TODO: Remove this when IK is implemented
    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    var y_rot = -input_dir[0] * 1.57
    if input_dir[1] > 0:
        if input_dir[0] != 0:
            y_rot = input_dir[0] * 1.57
        y_rot += Input.get_action_strength("movebackward") * 3.14

    mesh_instance.rotation.y = y_rot
    # ---


    return super(delta) # calls MovingState.process_physics(delta)
