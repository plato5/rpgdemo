class_name Math extends Reference


static func scale_node_dimension(current_dia: Vector2, scale: float) -> Vector2:
	var dimension: Vector2
	var x_pos = current_dia.x * scale
	var y_pos = current_dia.y * scale
	
	dimension = Vector2(x_pos, y_pos)
	return dimension
	
	
	
static func position_node_to_parent(current_pos: Vector2, x_scale: float, y_scale: float) -> Vector2:
	var position_rect: Vector2
	var x_pos = (current_pos.x * x_scale) / 2
	var y_pos = (current_pos.y * y_scale) / 2
	
	position_rect = Vector2(x_pos, y_pos)
	return position_rect
	
