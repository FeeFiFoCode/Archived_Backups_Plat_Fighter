extends State



@export
var stateIdle : State

@export
var stateFall : State

@export
var stateWalkSlow : State

@export
var stateWalkBack : State

var LS_MAP = StickMap.new().LeftStick["TeeterBack"]
var input_vector
var accelApplied = 0

func process_physics( delta : float ) -> State:
	input_vector = input.get_region_left_stick()
	print(input_vector)
#	util.debug("Input is: ",str(input_vector) )
	
	if not parent.is_on_floor():
		util.debug("Parent on floor: ",parent.is_on_floor() ) 
		return stateFall
	else:
		pass

	if not parent.is_facing_right:
		input_vector.x *= -1
		
	if LS_MAP["Deadzone"].has_point(input_vector):
#		print(debugString,"Stay in Idle")
		pass
		
	elif LS_MAP["WalkSlow"].has_point(input_vector):
#		print(debugString,"Go to walkSlow")
		return stateWalkSlow
		
	elif LS_MAP["WalkBack"].has_point(input_vector):
#		print(debugString,"Go to walkSlow")
		return stateWalkBack

	return null
