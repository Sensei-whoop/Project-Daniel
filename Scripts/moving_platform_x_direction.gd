extends CharacterBody3D

var velocityTing = 2.0
var maxTime = 5.0
var timer = 0.0
var platformSpeed = 2.0

func _physics_process(delta: float) -> void:
	velocity.y = 0
	timer += delta
	self.position.x += delta * velocityTing
	if timer > maxTime:
		velocityTing *= -1
		timer = 0.0
		
	
	move_and_slide()
