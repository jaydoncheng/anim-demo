extends State

@export
var idle_state : State

@export
var sprinting_state: State

@export
var jumping_state: State

@export
var attack_state: State

@export
var SPEED = 5.0

@export
var FRICTION = 1.0

func enter():
    super()

func process_input(event: InputEvent) -> State:
    if Input.is_action_pressed("attack"):
        attack_state.previous_state = self
        return attack_state
    return

func move(speed: float = SPEED):

    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    var direction = (object.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        object.velocity.x = direction.x * speed
        object.velocity.z = direction.z * speed
    else:
        return idle_state

    return

func process_physics(delta) -> State:
    object.velocity += object.get_gravity() * delta

    if Input.is_action_pressed("jump"):
        return jumping_state

    if Input.is_action_pressed("sprint"):
        return sprinting_state
    return move()

