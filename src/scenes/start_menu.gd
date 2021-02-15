extends Node

onready var _start_menu_view: TextureRect
onready var _start_image: ImageTexture
onready var _menu_items: VBoxContainer
onready var _start_btn: Button
onready var _load_btn: Button
onready var _exit_btn: Button
onready var _start_lbl: Label
onready var _window_size: Vector2

const math = preload("res://src/utils/math.gd")



# todo: might want to pull down some of this set up to child scripts
func _ready():
	_initialize()
	


func _initialize():
	_set_size_from_window()
	_set_start_menu_view()	
	_set_menu_items()
	
	
	
func _start_pressed() -> void:
	print("Starting Game...")
	
	

func _load_pressed() -> void:
	print("Loading Game...")
	
	

func _exit_pressed() -> void:
	print("Exiting Game...")
	
	
			
func _set_menu_items() -> void:
	_menu_items = get_node("start_menu_view/menu_items")	
	_menu_items.rect_size = math.scale_node_dimension(_window_size, 0.30)			
	_menu_items.rect_position = math.position_node_to_parent(_window_size, 0.30, 0.70)
	
	_start_lbl = get_node("start_menu_view/menu_items/start_lbl")
	_start_btn = get_node("start_menu_view/menu_items/start_btn")
	_load_btn = get_node("start_menu_view/menu_items/load_btn")
	_exit_btn = get_node("start_menu_view/menu_items/exit_btn")
	
	# todo: might want to put the label in a seperate container
	_start_lbl.rect_min_size = Vector2(100, 100)
	_start_lbl.text = "RPG DEMO"
	
	_set_buttons(_start_btn, "start")
	_set_buttons(_load_btn, "load")
	_set_buttons(_exit_btn, "exit")	
	
	
	
# todo: hard coded Vector's need to be scaled
func _set_buttons(btn: Button, type: String) -> void:
	if (type == "start"):
		btn.text = "START GAME"		
		btn.rect_min_size = Vector2(50, 50)
		btn.connect("pressed", self, "_start_pressed")
	elif (type == "load"):
		btn.text = "LOAD GAME"		
		btn.rect_min_size = Vector2(50, 50)
		btn.connect("pressed", self, "_load_pressed")
	elif(type == "exit"):
		btn.text = "EXIT GAME"		
		btn.rect_min_size = Vector2(50, 50)
		btn.connect("pressed", self, "_exit_pressed")
	
	
	
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
		
		
func _set_start_menu_view() -> void:
	_start_menu_view = get_node("start_menu_view")
	_start_menu_view.rect_size = _window_size	
	_start_menu_view.texture = _set_image_to_scale(_window_size)				
	
	
	
func _set_image_to_scale(current_scale: Vector2) -> ImageTexture:
	var menu_image: ImageTexture = ImageTexture.new()	
	var texture = load("res://assets/images/backgrounds/start_menu.jpg")	
	var image = texture.get_data()
	
	image.resize(current_scale.x, current_scale.y, 1)	
	menu_image.create_from_image(image)
	
	return menu_image
	
	
	
	
	
	
	
	
