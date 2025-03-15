extends State

@export
var moving_state: State

@export 
var jumping_state: State

@export
var attack_state: State

@export
var mesh_instance: MeshInstance3D

var speed = 10

func enter():
    super()
    mesh_instance.rotate_x(15)

func exit():
    mesh_instance.rotation.x = 0

func process_input(_event: InputEvent) -> State:
    if Input.is_action_pressed("attack"):
        attack_state.previous_state = self
        return attack_state

    if !Input.is_action_pressed("sprint"):
        return moving_state

    # if Input.is_action_pressed("jump"):
    #     jumping_state.jump_velocity = 8
    #     # object.velocity *= 0.4
    #     return jumping_state

    return

func process_physics(delta) -> State:
    if Input.is_action_pressed("jump"):
        jumping_state.jump_velocity = 6
        # object.velocity *= 0.4
        return jumping_state

    object.velocity += object.get_gravity() * delta

    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    print(input_dir)
    var direction = (object.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    print(direction)
    # if direction:
    #     object.rotation = direction

    return moving_state.move(speed)
