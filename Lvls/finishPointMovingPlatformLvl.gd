extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_parent_node_3d().get_tree().change_scene_to_file("res://Lvls/finalLevel2.tscn")
