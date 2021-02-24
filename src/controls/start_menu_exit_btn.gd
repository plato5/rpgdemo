extends Button

onready var exit_btn_func_property: FuncRef

#static classes
const _log = preload("res://src/utils/log.gd")

func _ready():
	_intialize()


func _intialize() -> void:  
	text = "EXIT GAME"		
	rect_min_size = Vector2(50, 50)
	if (connect("pressed", self, "_exit_pressed") != OK):
		_log.print_to_log("Event are not connected")


func _exit_pressed() -> void: 
	exit_btn_func_property.call_func()
