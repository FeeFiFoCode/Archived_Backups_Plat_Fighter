extends State

@export
var stateIdle : State

@export
var stateFall : State

@export
var stateWalkBack : State

@export
var stateWalkSlow : State

@export
var stateSquatWait : State

@export
var stateTurnTilt : State

@export
var stateDash : State

var ctr
var LS_MAP
var input_vector

func _ready() -> void:
	LS_MAP = StickMap.new().LeftStick[name]

func enter():
	super()
	ctr = 0

func process_physics( delta : float ) -> State:
	# Counter
	ctr+=1

	# Gather Inputs
	## LS, RS
	input_vector = input.get_region_left_stick()
	
	if not parent.is_facing_right:
		input_vector.x *= -1

#	# Debugging
#	util.debug(str(name))
#	util.debug(str(ctr))
#	util.debug(str(input_vector))
#	util.debug(str(parent.velocity.x))
	
	
	## BTN Buffers
	
	# State Checks
	if ctr >= stats.LAND_RECOVERY:
		if LS_MAP["Idle"].has_point(input_vector):
			return stateIdle
		elif LS_MAP["WalkSlow"].has_point(input_vector):
			return stateWalkSlow
		elif LS_MAP["WalkBack"].has_point(input_vector):
			return stateWalkBack
		elif LS_MAP["TurnTilt"].has_point(input_vector):
			return stateTurnTilt
		elif LS_MAP["Dash"].has_point(input_vector):
			return stateDash
		else:
			util.debug("Landing Recovery Reached, but Unclear Region to go to")
			pass
	else:
		pass

	### Very Temporary until Teeter Cancels are understood
	if not parent.is_on_floor():
		return stateFall

	## External Influence ( Dmg, etc )
	

	return null
