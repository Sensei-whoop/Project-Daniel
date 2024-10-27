extends CharacterBody3D

var health = 1
var speed = 3


var player_handle: CharacterBody3D = null

func take_damage(damage: int)-> void:
	health -= damage



func _process(delta: float) -> void:
	if health <= 0:
		queue_free()

func _physics_process(delta: float) -> void:
	if player_handle != null:
		look_at(player_handle.position)

		var direction := (transform.basis * Vector3.FORWARD)
		velocity = direction * speed

	move_and_slide()
		
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_handle = body
