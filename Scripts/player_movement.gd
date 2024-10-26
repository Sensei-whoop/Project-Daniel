extends CharacterBody3D


const SPEED = 15.0
const JUMP_VELOCITY = 4.5

const friction = 10
const air_resistance = 2.4

const camera_angle = 45;

var mouse_rotation = Vector2(0,0)
const mouse_sensitivity = 10

var cam1vector
var cam2vector

func _input(event):
	if event is InputEventMouseMotion:
		mouse_rotation = event.relative * 2*PI/360

	
	pass

func _ready() -> void:
	
	
	cam1vector = basis.rotated(Vector3.UP, camera_angle) * Vector3.RIGHT
	cam2vector = basis.rotated(Vector3.UP, -camera_angle) * Vector3.RIGHT
	$Camera3D.basis = $Camera3D.basis.rotated(Vector3.UP, camera_angle)
	$Camera3D2.basis = $Camera3D2.basis.rotated(Vector3.UP, -camera_angle)

func _physics_process(delta: float) -> void:
	var horizontal_velocity = Vector3(velocity.x,0,velocity.z)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity = direction * SPEED - horizontal_velocity * (horizontal_velocity.normalized().dot(direction)-1) + velocity.y * Vector3.UP
 	
	horizontal_velocity = Vector3(velocity.x,0,velocity.z)
	
	var attack = false

	if Input.is_action_just_pressed("attack"):
		attack = true
		$AnimationPlayer.play("Attack")
		
	if $AnimationPlayer.is_playing():
		attack = false

	
	transform.basis = transform.basis.rotated(Vector3.UP, -mouse_rotation.x * delta * mouse_sensitivity)
	$Camera3D.basis = $Camera3D.basis.rotated(cam1vector, -mouse_rotation.y * delta * mouse_sensitivity)
	$Camera3D2.basis = $Camera3D2.basis.rotated(cam2vector, -mouse_rotation.y * delta * mouse_sensitivity)
	mouse_rotation = Vector2.ZERO


	if attack:
		velocity += 50 * (transform.basis * Vector3.FORWARD)

	if is_on_floor() and not direction:
		velocity -= horizontal_velocity * friction * delta
	if not direction:
		velocity -= horizontal_velocity * air_resistance * delta

	if horizontal_velocity.length() < 5:
		velocity = Vector3(0, velocity.y, 0)
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
