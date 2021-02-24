extends Button


onready var load_btn_func_property: FuncRef

#static classes
const _log = preload("res://src/utils/log.gd")

func _ready():
	_intialize()


func _intialize() -> void:  
	text = "LOAD GAME"		
	rect_min_size = Vector2(50, 50)
	if (connect("pressed", self, "_load_pressed") != OK):
		_log.print_to_log("Event are not connected")


func _load_pressed() -> void: 
	load_btn_func_property.call_func()
