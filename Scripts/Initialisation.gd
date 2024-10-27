extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	
	pass


func _on_player_player_died() -> void:
	get_tree().reload_current_scene()


func _on_death_player_fell() -> void:
	get_tree().reload_current_scene()
