extends State




var input_vector
var speedTarget
var speedCurrent
var accelApplied = 0

var stickX
var direction

var scaleDirFacing
var ctr



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

@export
var stateDash : State

var LS_MAP

func _ready() -> void:
	LS_MAP = StickMap.new().LeftStick[name]

func enter():
	super()
	if parent.is_facing_right:
		scaleDirFacing = 1
	else:
		scaleDirFacing = -1
	
	ctr = 0
	return null


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
	if ctr == stats.CTR_IDLE:
		return stateIdle
	
	### Very Temporary until Teeter Cancels are understood
	if not parent.is_on_floor():
		return stateFall

	## External Influence ( Dmg, etc )
	
	## Input-Based
	if LS_MAP["Deadzone"].has_point(input_vector):
		pass
		
	elif LS_MAP["WalkSlow"].has_point(input_vector):
		return stateWalkSlow
		
	elif LS_MAP["WalkBack"].has_point(input_vector):
		return stateWalkBack
		
	
	elif LS_MAP["TurnTilt"].has_point(input_vector):
		return stateTurnTilt
		
	elif LS_MAP["Dash"].has_point(input_vector):
		return stateDash

	else:
#		util.debug("None of the above")
#		util.debug("Velocity Is: " + str(parent.velocity.x))
#		util.debug("Facing Right is " + str(parent.is_facing_right) )
#		util.debug("Un-modified Input Vector: " + str(input_vector) )
		pass
 
	# Movement Calculations - Use an external script ?
	stickX = abs(input_vector.x)
	speedTarget = 0.0
	## Scenarios A : 1 - 4
	### Facing Right, Not Too Fast, and Moving in a Correct Direction
	if parent.is_facing_right and ( stats.IDLE_SPEED_MAX >= stats.speed_x() ) and ( parent.velocity.x >= 0 ):
		# Scenario A1 - Speed Up to Target Speed
		## Since speedTarget is 0 and stats.speed_x() is always non-negative,
		## this should never be run.
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
	if parent.is_facing_right and ( stats.speed_x() > stats.IDLE_SPEED_MAX ) and ( parent.velocity.x >= 0 ):
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



	# Facing LEFT Scenarios
	if ( not parent.is_facing_right ) and ( stats.IDLE_SPEED_MAX >= stats.speed_x() ) and ( parent.velocity.x <= 0 ):
		# Scenario A1 - Speed Up to Target Speed
		## Since speedTarget is 0 and stats.speed_x() is always non-negative,
		## this should never be run.
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
	if not parent.is_facing_right and ( stats.speed_x() > stats.IDLE_SPEED_MAX ) and ( parent.velocity.x <= 0 ):
		# Scenario B1 - Slow Down to Target Speed.
		if ( stats.speed_x() > speedTarget ):
			accelApplied = mover.ground_halt_1(name,stickX)
			
		# Scenario B2 - Catch All Scenario
		else:
			util.debug("Scenario B2 - Facing Right, Correct Direction, Too Fast, but somehow not greater than Target ")
			pass
		
	## Scenarios C
	### Facing Right, Incorrect Direction
	if not parent.is_facing_right and ( parent.velocity.x > 0 ):
		# Scenario C1 - Slow Down
		util.debug("Scenario C - Facing Right, but WRONG Direction")
		accelApplied = mover.ground_to_rewind(name,stickX)
		pass
		
	if not parent.is_facing_right:
		accelApplied *= -1

	parent.velocity.x += accelApplied
	parent.move_and_slide()

	return null
