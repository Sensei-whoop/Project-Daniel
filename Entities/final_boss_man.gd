extends CharacterBody3D

var health = 20
var second_stage = false

var fighting = false

func _physics_process(delta: float) -> void:
	if health <= 10:
		second_stage = true
		$Node.second_attack()
	pass




func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		fighting = true
		$Node.send_player_handle(body)
		$Timer.start()


func _on_timer_timeout() -> void:
	if health > 10:
		$Node.base_attack()
		
