extends CharacterBody3D


@onready var bullet = preload("res://Entities/bullet.tscn")
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

	move_and_slide()


func _on_area_3d_3_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_handle = null
		$Timer.stop()

func _on_area_3d_3_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_handle = body
		print(player_handle)
		$Timer.start()


func _on_timer_timeout() -> void:
	var b = bullet.instantiate()
	owner.add_child(b)

	b.transform = transform
