extends Control

var rotateSpeed = 2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.rotation += delta * rotateSpeed;


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Lvls/test_scene.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_quit_button_mouse_entered() -> void:
	$VBoxContainer/quitButton.position.y = randf_range(0, get_viewport().get_visible_rect().size.y)
