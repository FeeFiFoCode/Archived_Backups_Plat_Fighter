extends Node
class_name StickRegion

var x_range
var y_range

func inRegion(input_vector) -> void:
	check = false
	if x_range.0 <= input_vector.x < x_range.1:
		if y_range.0 <= input_vector.y < y_range.1:
			   check = true
	
	return check
