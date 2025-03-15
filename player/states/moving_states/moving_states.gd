class_name MovingState
extends State

@export
var SPEED = 5.0

@export
var moving_state: State
@export
var sprinting_state: State
@export
var idle_state: State
@export
var jumping_state: State

func _ready():
    super()
    for child in get_children():
        if child is MovingState:
            child.moving_state = moving_state
            child.sprinting_state = sprinting_state
            child.idle_state = idle_state
            child.jumping_state = jumping_state

# Must always start with super()
func enter():
    super()

func exit():
    pass

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

    return move()
