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

var accelApplied = 0

var stickX
var direction

var scaleDirFacing
var ctr_Walk

var LS_MAP = StickMap.new().LeftStick["WalkSlow"]

@export
var stateIdle : State

@export
var stateTeeterBack : State

@export
var stateWalkSlow : State

@export
var stateWalkMid : State

@export
var stateWalkFast : State

@export
var stateWalkBackSlow : State
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
	# Update Counter
	ctr_Walk += 1
	
	# Gather Inputs
	## LS, RS
	input_vector = input.get_region_left_stick()
	
	if not parent.is_facing_right:
		input_vector.x *= -1

	## BTN Buffers
	
	# State Checks
	
	## No Input
	
	### Very Temporary until Teeter Cancels are understood
	if not parent.is_on_floor():
		return stateTeeterBack

	## External Influence ( Dmg, etc )
	
	## Input-Based
	if LS_MAP["Deadzone"].has_point(input_vector):
		return stateIdle
	
	elif LS_MAP[name].has_point(input_vector):
		pass
		
	elif LS_MAP["WalkSlow"].has_point(input_vector):
		return stateWalkSlow
		
	elif LS_MAP["WalkMid"].has_point(input_vector):
		return stateWalkMid

	elif LS_MAP["WalkFast"].has_point(input_vector):
		return stateWalkFast
		
	elif LS_MAP["WalkBackSlow"].has_point(input_vector):
		return stateWalkBackSlow
#	elif regionWalkFast.has_point(input_vector):
#		return stateWalkFast
#
#	elif regionJumpSquatSquat.has_point(input_vector):
#		return stateJumpSquatSquat
#
#	elif regionTiltTurn.has_point(input_vector):
##		print(debugString,"Go to tiltTurn")
#		return stateTiltTurn
#
#	elif regionDashBack.has_point(input_vector):
##		print(debugString,"Go to Dash Back")
#		return stateDashBack
#
#	elif regionSquat.has_point(input_vector):
#		return stateSquat

	else:
#		util.debug("None of the above")
#		util.debug("Velocity Is: " + str(parent.velocity.x))
#		util.debug("Facing Right is " + str(parent.is_facing_right) )
#		util.debug("Un-modified Input Vector: " + str(input_vector) )
		pass
 
	# Movement Calculations - Use an external script ?
	stickX = input_vector.x
	speedTarget = stickX * stats.WALK_SPEED_MAX
	## Scenarios A : 1 - 4
	### Facing Right, Not Too Fast, and Moving in a Correct Direction
	if parent.is_facing_right and ( stats.WALK_SPEED_MAX >= stats.speed_x() ) and ( parent.velocity.x >= 0 ):
		# Scenario A1 - Speed Up to Target Speed
		if ( speedTarget > stats.speed_x() ):
			accelApplied = mover.ground_speed_up_1(name,stickX)
					
		# Scenario A2 - Slow Down to Target Speed
		elif ( stats.speed_x() > speedTarget ):
			accelApplied = mover.ground_slow_down_1(name,stickX)

		
		# Scenario A3 - Equal Speeds
		elif ( speedTarget == stats.speed_x() ):
			accelApplied = 0
		
		else:
			util.debug("Scenario A4 - Speeds neither <. >, nor = ")
			pass
	
	## Scenarios B : 1 - 2
	### Facing Right, Moving in Correct Direction, but moving too fast.
	if parent.is_facing_right and ( stats.speed_x() > stats.WALK_SPEED_MAX ) and ( parent.velocity.x >= 0 ):
		# Scenario B1 - Slow Down to Target Speed.
		if ( stats.speed_x() > speedTarget ):
			accelApplied = mover.ground_halt_1(name,stickX)
			
		# Scenario B2 - Catch All Scenario
		else:
			util.debug("Scenario B2 - Facing Right, Correct Direction, Too Fast, but somehow not greater than Target ")
			pass
		
	## Scenarios C
	### Facing Right, Incorrect Direction
	if parent.is_facing_right and ( parent.velocity.x < 0 ):
		# Scenario C1 - Slow Down
		util.debug("Scenario C - Facing Right, but WRONG Direction")
		accelApplied = mover.ground_to_rewind(name,stickX)
		pass

	parent.velocity.x += accelApplied
	parent.move_and_slide()

	return null
