extends InputContract

# Controller Type ( varies for other controllers )
var controller_type = "Keyboard"
#
## Input Sensitivity for Analog Inputs
### Left Stick
#### Sensitivities
#var sensitivity_left_stick = 1.0
#var sensitivity_left_stick_x = sensitivity_left_stick
#var sensitivity_left_stick_y = sensitivity_left_stick
#
### Signal Handling
#var left_x
#var left_y
#
#var sensitivity_right_stick = 1.0
#var sensitivity_right_stick_x = sensitivity_right_stick
#var sensitivity_right_stick_y = sensitivity_right_stick
#
#var sensitivity_left_trigger = 1.0
#var sensitivity_right_trigger = 1.0

var mod_x_x = 0.6625
var mod_x_y = 0.5375

var mod_y_x = 0.3375
var mod_y_y = 0.7375

# Get Regions
func get_region_left_stick() -> Vector2:
	# Handling Left Horizontal
	if Input.is_action_pressed("kb_move_left") or Input.is_action_just_pressed("kb_move_left"):
		left_x = -1.0
	elif Input.is_action_pressed("kb_move_right") or Input.is_action_just_pressed("kb_move_right"):
		left_x = 1.0
	else:
		left_x = 0.0

	# Handling Left Vertical
	if Input.is_action_pressed("kb_move_up") or Input.is_action_just_pressed("kb_move_up"):
		left_y = 1.0
	elif Input.is_action_pressed("kb_move_down") or Input.is_action_just_pressed("kb_move_down"):
		left_y = -1.0
	else:
		left_y = 0.0

	# Modifier Buttons
	if Input.is_action_pressed("mod_x") or Input.is_action_just_pressed("mod_x"):
		left_x *= mod_x_x
		left_y *= mod_x_y

	if Input.is_action_pressed("mod_y")  or Input.is_action_just_pressed("mod_y"):
		left_x *= mod_y_x
		left_y *= mod_y_y



#	return Vector2(left_x,left_y).normalized()
	return Vector2(left_x,left_y)
	
#func get_region_left_stick() -> Vector2:
#	return Vector2( 0.95,0 )
