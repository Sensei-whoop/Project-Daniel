extends CharacterBody3D

@onready var bullet = preload("res://Entities/bullet.tscn")

var player_handle = null

var x = 0

func _physics_process(delta: float) -> void:
	if player_handle != null:
		look_at(player_handle.position)

func send_player_handle(handle):
	player_handle = handle

func shoot(i):
	if i.get_name() != "Timer" and i.get_name() != "CollisionShape3D":
		print(i.get_name())
		var b = bullet.instantiate()
		owner.add_child(b)
		b.transform = i.get_transform()
		pass

	

func base_attack()->void:
	for i in get_children():
		shoot(i)

func second_attack()->void:
	$Timer.start()




func _on_timer_timeout() -> void:
	shoot(get_children()[x])
	x += 1
