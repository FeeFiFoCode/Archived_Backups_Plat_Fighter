extends Node
class_name Region

var btm_left
var top_right

func _init(btm_left_incoming,top_right_incoming):
	btm_left = btm_left_incoming
	top_right = top_right_incoming
	pass

func has_point( input_vector ) -> bool:
	var check = false
	
	if ( btm_left.x <= input_vector.x  and input_vector.x < top_right.x ):
		if ( btm_left.y <= input_vector.y ) and ( input_vector.y < top_right.y ):
			check = true

	return check
#
#func Region(btm_left,top_right) -> Rect2:
#	var width = top_right.x - btm_left.x
#	var height = top_right.y - btm_left.y
#
#	return Rect2(btm_left.x,btm_left.y,width,height)
