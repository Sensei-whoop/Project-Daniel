extends CharacterBody3D


const SPEED = 25.0
const JUMP_VELOCITY = 4.5


var mouse_rotation = Vector2(0,0)
const mouse_sensitivity = 10

func _input(event):
	if event is InputEventMouseMotion:
		mouse_rotation = event.relative * 2*PI/360
	
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

		
	transform.basis = transform.basis.rotated(Vector3.UP, -mouse_rotation.x * delta * mouse_sensitivity)
	$Camera3D.basis = $Camera3D.basis.rotated(Vector3.FORWARD, -mouse_rotation.y * delta * mouse_sensitivity)
	$Camera3D2.basis = $Camera3D2.basis.rotated(Vector3.FORWARD, mouse_rotation.y * delta * mouse_sensitivity)
	mouse_rotation = Vector2.ZERO

	move_and_slide()
