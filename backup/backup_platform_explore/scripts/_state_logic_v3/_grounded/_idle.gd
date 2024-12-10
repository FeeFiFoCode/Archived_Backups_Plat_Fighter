extends _State

const nameState = "Idle"
var debugString = "Debug - " + nameState + ": "

var regionDeadzoneLeft = Region.new(Vector2(-0.2750,-0.6875), Vector2(0.2750,0.6500) )
var regionWalkSlow = Region.new(Vector2(0.2875,-0.6875), Vector2(0.4000,0.6500))

var regionJump = Region.new(Vector2(-0.7375,0.6625),Vector2(0.7375,1.000))
var regionTiltTurn = Region.new(Vector2(-0.7875,-0.6875), Vector2(-0.2875,0.6500))

var regionDash = Region.new(Vector2(0.8000,-0.6000),Vector2(1.000,0.5500))
var regionDashJump = Region.new(Vector2(0.8000,0.5625),Vector2(0.8250,0.6000))

var regionDashBack = Region.new(Vector2(-1.000,-0.6000),Vector2(-0.8000,0.5500))
var regionTurnDashJump = Region.new(Vector2(-0.8250,0.5626),Vector2(-0.8000,0.6000))

var regionSquat = Region.new(Vector2(-0.7875,-0.6250),Vector2(0.7875,-0.6250))

var input_vector
var accelApplied = 0

#func enter() -> void:
#	super()

#
@export
var stateIdle : _State

var stateFall : _State

@export
var stateWalkSlow : _State
var stateJump : _State

@export
var stateTiltTurn : _State

@export
var stateSquat : _State

@export
var stateDash : _State

var stateDashJump  : _State

@export
var stateDashBack : _State
var stateTurnDashJump : _State

var temp_state : _State
#@export
#var jump_state : _State
#@export
#var move_state : _State
#@export
#var waveGround_state : _State

var mapRegionLeft = [
	[ regionDeadzoneLeft, stateIdle ],
	[ regionWalkSlow, stateWalkSlow ],
	[ regionJump, stateJump ],
	[ regionTiltTurn, stateTiltTurn ],
	[ regionDash , stateDash ],
	[ regionDashJump, stateDashJump ],
	[ regionDashBack, stateDashBack ],
	[ regionTurnDashJump, stateTurnDashJump ],
	[ regionSquat, stateSquat ]
]

#
#var input_dir
#var midi_direction = Vector2(0.0, 0.0)
#var direction
#var previous_input
#
#func enter() -> void:
#	super()
##	parent.velocity.x = 0
##	parent.velocity.z = 0
##	print(parent.velocity.y)
#	ctr_wave_air = CTR_WAVE_AIR
#	ctr_jump = CTR_JUMP_MAX
#
#	if move_component.input_buffer.size() > 0:
#		previous_input = move_component.input_buffer[-1]
#		if move_component.is_direction_pressed(previous_input):
#			midi_direction = move_component.midi_direction
#
func process_physics( delta : float ) -> _State:
#	print("Horizontal Velocity: ",parent.velocity.x)
#	print("Body: ")

	if parent.velocity.x > parent.WALK_SPEED_MAX:
		accelApplied = 2*parent.TRACTION
	
	elif parent.velocity.x > 0:
		accelApplied = parent.TRACTION
	
	elif parent.velocity.x < -1*parent.WALK_SPEED_MAX:
		accelApplied = -2 * parent.TRACTION
		
	elif parent.velocity.x < 0:
		accelApplied = -1 * parent.TRACTION
	else:
		pass
	
	# Check if accelerating will cross 0.
	## If it does not, then just acceelerate as normal.
	## If it does, then just set velocity to 0.
	if sign(parent.velocity.x) == sign(parent.velocity.x + accelApplied ):
		parent.velocity.x += accelApplied
	else:
		parent.velocity.x = 0

	parent.move_and_slide()

	return null

#func process_input(event : InputEvent) -> _State:
##	print("Debug: ",event)
#
#	# Jump Logics
#	if event is InputEventMIDI:
#		if move_component.wants_jump(event) and parent.is_on_floor():
#			return jump_state
#
#	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
#		return jump_state
#
#	# Wave Logics
#	if Input.is_action_just_pressed("wave_burst") and parent.is_on_floor():
#		return waveGround_state
#
#	if event is InputEventMIDI:
#		if move_component.wants_wave(event) and parent.is_on_floor():
#			return waveGround_state
#
#	# Move Logics
#	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
##		input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
##		direction = parent.transform.basis * Vector3(input_dir.x, 0, 0)
#		return move_state
#
#	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
##		input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
##		direction = parent.transform.basis * Vector3(input_dir.x, 0, 0)
#		return move_state
#
#	if event is InputEventMIDI:
#		if move_component.midi_direction(event) and parent.is_on_floor():
#			return move_state
#
#	if event is InputEventMIDI:
#		if move_component.is_direction_pressed(event) and parent.is_on_floor():
#			midi_direction = move_component.midi_direction(event)
#
#	return null
#
#
#func process_physics( delta : float ) -> _State:
##	print("Debug: Is Parent on Floor: ",parent.is_on_floor())
##	parent.velocity.y += gravity * delta
##	parent.move_and_slide()
##	print(parent.velocity.y)
#
#	if not parent.is_on_floor():
#		return fall_state
#
#	if move_component.input_buffer.size() > 0:
#		previous_input = move_component.input_buffer[-1]
#		if move_component.is_direction_pressed(previous_input):
#			return move_state
#
#	print("Debug - idle_test.gd - Velocity is: ",parent.velocity)
##	else:
##		parent.velocity.x = move_toward(parent.velocity.x, 0, move_speed)
##		parent.velocity.y = move_toward(parent.velocity.y, 0, move_speed)
##		parent.velocity.z = move_toward(parent.velocity.z, 0, move_speed)
##
##		parent.move_and_slide()
#	return null
#
func process_frame(delta : float ) -> _State:

	input_vector = Vector2( Input.get_joy_axis(0,JOY_AXIS_LEFT_X), Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) )

#	print(debugString,input_vector)
	print(debugString,"Velocity Is: ",parent.velocity.x)
	print(debugString,"Facing Right is ",parent.is_facing_right)
	
	if not parent.is_facing_right:
		input_vector.x *= -1
		
	if regionDeadzoneLeft.has_point(input_vector):
#		print("Debug - _idle.gd : Stay in Idle")
		pass
		
	elif regionWalkSlow.has_point(input_vector):
#		print("Debug - _idle.gd : Go to walkSlow")
		return stateWalkSlow
		
	elif regionJump.has_point(input_vector):
		print(debugString,"Go to Jump")
		pass
		
	elif regionTiltTurn.has_point(input_vector):
		print(debugString,"Go to Tilt Turn")
		return stateTiltTurn
		
	elif regionDashBack.has_point(input_vector):
		print(debugString,"Go to Dash Back")
		return stateDashBack
		
	elif regionDash.has_point(input_vector):
		print(debugString,"Go to Dash")
		return stateDash

	else:
		print(debugString,"None of the above")

#	print("DeadzoneLeft: ",deadzoneLeft)
	return null
	
#Vector2 get_vector ( StringName negative_x, StringName positive_x, StringName negative_y, StringName positive_y, float deadzone=-1.0 )


#func exit():
#	input_dir = Vector2(0.0, 0.0)
#	midi_direction = Vector2(0.0, 0.0)
