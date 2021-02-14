extends Node

onready var _start_menu_image: TextureRect
onready var _start_image: ImageTexture
onready var _window_x: int
onready var _window_y: int


func _ready():
	_initialize()
	

func _initialize():
	_window_x = get_viewport().size.x
	_window_y = get_viewport().size.y
	
	_start_menu_image = get_node("start_menu_image")
	_start_menu_image.rect_size = Vector2(_window_x, _window_y)
	
	_start_menu_image.texture = _start_menu_image_to_scale(_window_x, _window_y)
	add_child(_start_menu_image)
	

func _start_menu_image_to_scale(x: int, y: int) -> ImageTexture:
	var menu_image: ImageTexture = ImageTexture.new()	
	var texture = load("res://assets/images/backgrounds/start_menu.jpg")
	
	var image = texture.get_data()
	image.resize(x, y, 1)	
	menu_image.create_from_image(image)
	
	return menu_image
	
	
	
	
	
	
