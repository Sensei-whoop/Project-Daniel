extends Area3D


var speed = 3
var velocity = Vector3.ZERO

func _physics_process(delta: float) -> void:
	var direction := (transform.basis * Vector3.FORWARD)
	velocity = direction * speed
	
	transform.origin += velocity * delta


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		var player = body
		body.take_damage(2)
