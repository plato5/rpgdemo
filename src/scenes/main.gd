extends Node

onready var _scene_manager: TextureRect

# static classes
const _log = preload("res://src/utils/log.gd")


func _ready():
	_handle_errors("running main....")
	initialize()
		
				
func initialize():
	_scene_manager = get_node("scene_manager")
	_scene_manager.exit_game_func_property = funcref(self, "handle_exit")
	
					
func handle_exit():
	if (_scene_manager != null):
		_scene_manager.queue_free()	
	get_tree().quit()
		

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
	
	
	
