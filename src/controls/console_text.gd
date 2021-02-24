extends RichTextLabel

onready var _window_size: Vector2
onready var _current_size: Vector2

# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")


func _ready():
	_initialize()


func _initialize() -> void:
    _window_size = get_viewport().size	
    _current_size = _math.scale_node_dimension(_window_size, 0.65)
    rect_min_size = _math.scale_node_dimension(_current_size, 0.65)	
    text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
		

