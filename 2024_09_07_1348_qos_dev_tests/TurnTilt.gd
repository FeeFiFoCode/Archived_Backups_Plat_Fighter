extends State




var input_vector
var speedTarget
var speedCurrent
var accelApplied

var stickX
var direction

var scaleDirFacing
var ctr

var LS_MAP = StickMap.new().LeftStick["TurnTilt"]

@export
var stateIdle : State

@export
var stateFall : State

@export
var stateWalkSlow : State

@export
var stateWalkBack : State

@export
var stateTurnTilt : State

func enter():
	super()
	ctr = 0
	# logically flip the way parent is facing
	# NOTE
	## Interesting glitch if... parent.is_facing_right = not parent.is_facing_right
	### Then again if you do the conditional expression that filps
	### Interesting visibly with the flipping  ( rotating ) approach in here as well
	
	# Questionable Rotation Approach...
	if parent.is_facing_right:
		# Questionable Approach
		parent.body.rotate_object_local(Vector3(0, 1, 0), util.AMT_ROTATE)
		parent.is_facing_right = not parent.is_facing_right
	else:
		parent.body.rotate_object_local(Vector3(0, 1, 0), -1*util.AMT_ROTATE)
		parent.is_facing_right = not parent.is_facing_right
	
	pass
#
func process_physics( delta : float ) -> State:
	# Update Counter
	ctr += 1
	
	# Gather Inputs
	## LS, RS
	input_vector = input.get_region_left_stick()
	
	if not parent.is_facing_right:
		input_vector.x *= -1

	# Debugging
	util.debug(str(name))
	util.debug(str(ctr))
	util.debug(str(input_vector))
	util.debug(str(parent.velocity.x))
	
	
	## BTN Buffers

	# State Checks
	
	## No Input
	
	### Very Temporary until Teeter Cancels are understood
	if not parent.is_on_floor():
		return stateFall

	## External Influence ( Dmg, etc )
	
	## Input-Based	
	if ctr >= stats.FRAME_TURN_STEP:
		if LS_MAP["Deadzone"].has_point(input_vector):
			return stateIdle
		else:
			pass

#
#		if regionJumpSquat.has_point(input_vector):
#			return stateJumpSquat
#
#		elif regionDash.has_point(input_vector):
##			print(debugString,"Go to Dash")
#			return stateDash
#
#	if ctr_turn >= parent.FRAME_TURN_STAND:
#		debug(ctr_turn)
#		if regionDeadzone.has_point(input_vector):
#			debug("Should be idle after tiltTurn.")
#			return stateIdle
#
#		elif regionWalkSlow.has_point(input_vector):
#	#		print("Debug - _idle.gd : Go to walkSlow")
#			return stateWalkSlow
#
#		elif regionTiltTurn.has_point(input_vector):
##			print(debugString,"Go to Tilt Turn")
#			return stateTiltTurn

#	else:
#		print(debugString,"None of the above")
#		print(debugString,"ctr :",ctr_turn)
#		return stateError

#	print("DeadzoneLeft: ",deadzoneLeft)
	return null
