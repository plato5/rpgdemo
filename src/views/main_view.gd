class_name MainView extends TextureRect

onready var _map_image: ImageTexture
onready var _window_size: Vector2

const _image_handler = preload("res://src/utils/image_handler.gd")

func _ready():
	_initialize()


func _initialize() -> void:
	_set_size_from_window()
	_map_image = _image_handler.set_image_texture_to_scale(_window_size, "res://assets/images/backgrounds/gamemap.jpg")				
	rect_size = _window_size
	texture = _map_image
	

func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
