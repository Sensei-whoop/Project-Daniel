extends CharacterBody3D

var velocityTing = 2.0
var maxTime = 7.0
var timer = 0.0
var platformSpeed = 2.0

func _physics_process(delta: float) -> void:
	timer += delta
	self.position.y += delta * velocityTing
	if timer > maxTime:
		velocityTing *= -1
		timer = 0.0
		
	
	move_and_slide()
