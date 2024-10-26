extends GridContainer

@onready var viewport1: SubViewport = $SubViewportContainer/SubViewport
@onready var viewport2: SubViewport = $SubViewportContainer2/SubViewport2
@onready var bar = $"Central Bar/MeshInstance2D"
@onready var Camera1: Camera3D = get_node("../Player/Camera3D")
@onready var Camera2: Camera3D = get_node("../Player/Camera3D2")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Camera_rid1 = Camera1.get_camera_rid()
	var Camera_rid2 = Camera1.get_camera_rid()
	var viewport_rid1 = viewport1.get_viewport_rid()
	var viewport_rid2 = viewport2.get_viewport_rid()
	RenderingServer.viewport_attach_camera(viewport_rid1, Camera_rid1)
	RenderingServer.viewport_attach_camera(viewport_rid2, Camera_rid2)
	_on_viewport_resize()

	get_viewport().connect("size_changed", _on_viewport_resize)

	

func _on_viewport_resize() -> void:
	var screen_size = DisplayServer.window_get_size();

	viewport1.size = Vector2(screen_size.x/2-1,screen_size.y)
	bar.scale = Vector2(4, screen_size.y * 2)
	viewport2.size = Vector2(screen_size.x/2-1,screen_size.y)
	print(screen_size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
