extends CharacterBody3D

var velocityTing = 4.0
	
func _physics_process(delta: float) -> void:
	const bounds = 4.5
	if self.position.z > bounds or  self.position.z < -bounds:
		velocityTing *= -1
	self.position.z += velocityTing * delta
	
	move_and_slide()
