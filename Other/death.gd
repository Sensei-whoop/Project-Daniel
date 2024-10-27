extends Node3D

signal player_fell()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_fell.emit()
	
	if body.is_in_group("Enemy"):
		var enemy = body
		enemy.take_damage(1000)
