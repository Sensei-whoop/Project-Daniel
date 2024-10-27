extends CharacterBody3D

var velocityTing = 4.0
const bounds = 4.5
func _physics_process(delta: float) -> void:
	velocity.y = 0

	if self.position.z > bounds or  self.position.z < -bounds:
		velocityTing *= -1
		
	self.position.z += velocityTing * delta
	
	move_and_slide()
