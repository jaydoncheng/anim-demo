extends CharacterBody3D

const MOUSE_SENSITIVITY = 0.00085
const VERTICAL_ANGLE_LIMIT = 45

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _ready() -> void:
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
        rotate_horizontal(-event.relative.x * MOUSE_SENSITIVITY)
        rotate_vertical(-event.relative.y * MOUSE_SENSITIVITY)
    if event.is_action_pressed("ui_cancel"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    if event.is_action("mouse_left"):
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func rotate_horizontal(angle: float) -> void:
    rotate_y(angle)

func rotate_vertical(angle: float) -> void:
    # Get the current rotation around the X axis in degrees.
    var current_angle: float = rad_to_deg($SpringArm3D.rotation.x)

    # Calculate the new angle, clamping it to the vertical limits.
    var new_angle: float = clamp(
        current_angle + rad_to_deg(angle),
        -VERTICAL_ANGLE_LIMIT,
        VERTICAL_ANGLE_LIMIT
    )

    # Convert back to radians and apply the rotation.
    $SpringArm3D.rotation.x = deg_to_rad(new_angle)

func _physics_process(delta):
    # Add the gravity.
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Handle jump.
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    var input_dir = Input.get_vector("moveleft", "moveright", "moveforward", "movebackward")
    var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        velocity.x = direction.x * SPEED
        velocity.z = direction.z * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)
        velocity.z = move_toward(velocity.z, 0, SPEED)

    move_and_slide()
