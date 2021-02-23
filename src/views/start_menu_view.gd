extends TextureRect

onready var _window_size: Vector2

#static classes
const _image_handler = preload("res://src/utils/image_handler.gd")


func _ready():	
	_initialize()
	

func _initialize() -> void:
    _set_size_from_window()
    rect_size = _window_size	
    texture = _image_handler.set_image_texture_to_scale(_window_size, "res://assets/images/backgrounds/start_menu.jpg")				
	

func _set_size_from_window() -> void:
    _window_size = get_viewport().size	
        