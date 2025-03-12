extends State

@export
var idle_state : State

@export
var sprinting_state: State

@export
var jumping_state: State

@export
var SPEED = 5.0

func enter():
    super()

func process_input(event: InputEvent) -> State:
    if Input.is_action_pressed("jump"):
        return jumping_state

    return

func move(speed: float = SPEED):
    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    var direction = (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        parent.velocity.x = direction.x * speed
        parent.velocity.z = direction.z * speed
    else:
        parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
        parent.velocity.z = move_toward(parent.velocity.z, 0, speed)

    parent.move_and_slide()

    if !parent.velocity:
        return idle_state

    return null

func process_physics(_delta) -> State:
    if Input.is_action_pressed("sprint"):
        return sprinting_state

    return move()

