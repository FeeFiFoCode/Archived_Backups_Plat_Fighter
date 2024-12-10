extends State


## Regions
#var regionJumpSquatSquat = Region.new(Vector2(-1.000,0.6625),Vector2(1.000,1.000))
#
#var regionTiltTurn = Region.new(Vector2(-0.7875,-0.6500), Vector2(-0.2875,0.6500))
#
#var regionDash = Region.new(Vector2(0.8000,-0.6500),Vector2(1.000,0.6500))
#var regionDashBack = Region.new(Vector2(-1.000,-0.6500),Vector2(-0.8000,0.6500))
#
#var regionSquat = Region.new(Vector2(-0.7875,-1.000),Vector2(0.7875,-0.6625))

var input_vector

var speedTarget
var speedCurrent
var accelWalkStanding
var accelWalk
var accelApplied

var stickX
var direction

var scaleDirFacing
var ctr_Walk

#var LS_MAP = StickMap.new().LeftStick[name]

@export
var stateIdle : State

@export
var stateTeeter : State

@export
var stateWalkSlow : State
#@export
#var stateWalkMid : State
#@export
#var stateWalkFast : State
#
#@export
#var stateJumpSquatSquat : _State
#
#@export
#var stateTiltTurn : _State
#
#@export
#var stateDash : _State
#@export
#var stateDashBack : _State
#
#@export
#var stateSquat : _State


func enter():
	super()
	if parent.is_facing_right:
		scaleDirFacing = 1
	else:
		scaleDirFacing = -1
	
	ctr_Walk = 0
	return null


func process_physics( delta : float ) -> State:
	ctr_Walk += 1
	input_vector = input.get_region_left_stick()
	
	if not parent.is_facing_right:
		input_vector.x *= -1
	
	# Very Temporary until Teeter Cancels are understood
	if not parent.is_on_floor():
		return stateTeeter
	else:
		pass
#	if ctr_Walk <= stats.FRAME_PRE_DASH_STEP:
#		if LS_MAP["Dash"].has_point(input_vector):
#			return stateDash
	if false:
		# Placeholder
		pass
	else:	
		if LS_MAP["Deadzone"].has_point(input_vector):
			return stateIdle
			
		elif LS_MAP[name]:
			pass
		
		elif LS_MAP["WalkSlow"].has_point(input_vector):
			return stateWalkSlow
#
#		elif regionWalkMid.has_point(input_vector):
#			return stateWalkMid
#
#		elif regionWalkFast.has_point(input_vector):
#			return stateWalkFast
#
#		elif regionJumpSquatSquat.has_point(input_vector):
#			return stateJumpSquatSquat
#
#		elif regionTiltTurn.has_point(input_vector):
#	#		print(debugString,"Go to tiltTurn")
#			return stateTiltTurn
#
#		elif regionDashBack.has_point(input_vector):
#	#		print(debugString,"Go to Dash Back")
#			return stateDashBack
#
#		elif regionSquat.has_point(input_vector):
#			return stateSquat
			
		else:
#			util.debug("None of the above")
#			util.debug("Velocity Is: " + str(parent.velocity.x))
#			util.debug("Facing Right is " + str(parent.is_facing_right) )
#			util.debug("Un-modified Input Vector: " + str(input_vector) )
			pass
			
		if parent.is_facing_right:
			scaleDirFacing = 1
		else:
			scaleDirFacing = -1
			
	#	if parent.is_facing_right:

	#		speedCurrent = abs( parent.velocity.x )*scaleDirFacing
	#		stickX = abs( Input.get_joy_axis(0,JOY_AXIS_LEFT_X) )*scaleDirFacing
		speedCurrent = abs( parent.velocity.x )
		stickX = abs( input_vector.x )
		
	#		if Input.get_joy_axis(0,JOY_AXIS_LEFT_X) < 0:
	#			direction = -1
	#		else:
	#			direction = 1
		
		speedTarget = stats.WALK_SPEED_MAX * stickX
	#		print("Position:",parent.transform)
	#		print("Velocity X:",parent.velocity.x)
		
		if speedCurrent == 0:
	#		print(debugString,"Debug Check Right.1A")
			accelWalkStanding = stats.WALK_ACCEL_BASE + ( stickX * stats.WALK_ACCEL_SCALE )
			accelApplied = accelWalkStanding
			
		elif speedCurrent > 0:
			if speedCurrent > speedTarget:
	#			print(debugString,"Debug Check Right.2A")
	#				accelApplied = parent.TRACTION * direction
				accelApplied = mover.ground_slow_down_1(name,stickX)
				
			elif speedCurrent < speedTarget:
	#			print(debugString,"Debug Check Right.2B")
#				accelWalkStanding = stats.WALK_ACCEL_BASE + ( stickX * stats.WALK_ACCEL_SCALE )
#				accelWalk = 0.5 * accelWalkStanding * ( 1 - speedCurrent/speedTarget)
#				accelApplied = accelWalk
				accelApplied = mover.ground_speed_up_1(name,stickX)

			else:
	#			print(debugString,"Debug Check Right.2C")
				accelApplied = 0

		else:
	#		print(debugString,"Debug Check Right.3A")
			accelWalkStanding = stats.WALK_ACCEL_BASE + ( stickX * stats.WALK_ACCEL_SCALE )
			accelApplied = accelWalkStanding
	#
	#
	#
	#
	#
	#		elif not parent.is_facing_right:
	#			if speedCurrent > speedTarget:
	#				accelWalkStanding = parent.ACCEL_WALK_BASE + ( stickX * parent.ACCEL_WALK_SCALE )
	#				accelWalk = 0.5 * accelWalkStanding * ( 1 - speedCurrent/speedTarget)
	#				accelApplied = accelWalk * scaleDirFacing
	#
	#			elif speedCurrent > speedTarget:
	#				accelApplied = parent.TRACTION * scaleDirFacing
	#
		#	if not parent.is_facing_right:
		#		accelApplied *= -1
			
		#	print("Debug - _walkSlow, process_physics; accelApplied:",accelApplied)
		accelApplied *= scaleDirFacing
		
		if sign(parent.velocity.x) == -1*sign(parent.velocity.x + accelApplied ):
			parent.velocity.x = 0
		else:
			parent.velocity.x += accelApplied
		
		parent.move_and_slide()
		


	#	print("DeadzoneLeft: ",deadzoneLeft)
	#	return null
		
	return null
#
#func process_frame(delta : float ) -> _State:

	
#Vector2 get_vector ( StringName negative_x, StringName positive_x, StringName negative_y, StringName positive_y, float deadzone=-1.0 )


#func exit():
#	input_dir = Vector2(0.0, 0.0)
#	midi_direction = Vector2(0.0, 0.0)
