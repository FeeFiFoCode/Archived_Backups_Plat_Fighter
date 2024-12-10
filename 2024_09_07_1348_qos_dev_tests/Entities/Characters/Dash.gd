extends State
#
#
#
#var input_vector
#var speedTarget
#var speedCurrent
#var accelApplied
#
#var stickX
#var direction
#
#var scaleDirFacing
#var ctr
#
#var flagSun = false
#var flagMoon = false
#
#var LS_MAP = StickMap.new().LeftStick["Dash"]
#
#@export
#var stateIdle : State
#
#@export
#var stateWalkSlow : State
#
#@export
#var stateWalkBack : State
#
#@export
#var stateDash : State
#
#@export
#var stateTurnTilt : State
#
#@export
#var stateTurnSmash : State
#
#@export
#var stateFall : State
#
#@export
#var stateRun : State
#
## Moon & Sun States
#@export
#var stateWalkMoon : State
#
#@export
#var stateDashMoon : State
#
#@export
#var stateDashSun : State
#
#@export
#var stateWalkSun : State
#
#@export
#var stateDashSticky : State
#
#@export
#var stateSquat : State
#
#@export
#var stateJumpSquat : State
#
#func enter():
#	super()
#	ctr = 0
#
#func process_physics( delta : float ) -> State:
#	# Update Counter
#	ctr += 1
#
#	# Gather Inputs
#	## LS, RS
#	input_vector = input.get_region_left_stick()
#
#	if not parent.is_facing_right:
#		input_vector.x *= -1
#
#	# Debugging
#	util.debug(str(name))
#	util.debug(str(ctr))
#	util.debug(str(input_vector))
#	util.debug(str(parent.velocity.x))
#
#
#	## BTN Buffers
#
#	# State Checks
#
#	## No Input
#
#	### Very Temporary until Teeter Cancels are understood
#	if not parent.is_on_floor():
#		return stateFall
#
#	## External Influence ( Dmg, etc )
#
#	## Input-Based
#	### Universal Phases - Checked every Physics Frame
#	if LS_MAP["JumpSquat"].has_region():
#		return stateJumpSquat
##	Dash Grab
##	Taunt
##	Meter Boost
#
#
#
#	### Phased Checks - Conditionally Checked per Frame
#	if ctr < stats.DASH_FRAME_PRE:
#		# Pre Checks
#		if LS_MAP["Moon"].has_region():
#			flagMoon = true
#
#		if LS_MAP["Sun"].has_region():
#			flagSun = true
#
#		pass
#
#	elif ctr < stats.DASH_FRAME_PRIME:
#		# Primary Checks
#
#		if flagMoon:
#			if LS_MAP["DashMoon"].has_region():
#				return stateDashMoon
#
#			elif LS_MAP["WalkMoon"].has_region():
#				return stateWalkMoon
#
#			elif LS_MAP["Deadzone"].has_region():
#				return stateDashSticky
#
#			else:
#				util.debug("Flag Moon, but No Catch")
#				pass
#
#		if flagSun:
#			if LS_MAP["DashSun"].has_region():
#				return stateDashSun
#
#			elif LS_MAP["SunWalk"].has_region():
#				return stateWalkSun
#
#			elif LS_MAP["DashSticky"].has_region():
#				return stateDashSticky
#
#			else:
#				util.debug("Flag Sun, but No Catch")
#				pass
#
#		if LS_MAP["TurnSmash"].has_region():
#			return stateTurnSmash
#		pass
#
#	elif ctr < stats.DASH_FRAME_SEC:
#		# Secondary Checks
#		if LS_MAP["TurnSmash"].has_region():
#			return stateTurnSmash
#
#		elif LS_MAP["Run"].has_region():
#			return stateRun
#
#		else:
#			util.debug("Dash Secondary - but No Catch")
#			pass
#
#		pass
#	elif ctr < stats.DASH_FRAME_COOL:
#		# Cooldown Checks
#		if LS_MAP["TurnSmash"].has_region():
#			return stateTurnSmash
#
#		elif LS_MAP["Dash"].has_region():
#			return stateDash
#
#		elif LS_MAP["Run"].has_region():
#			return stateRun
#
#		else:
#			util.debug("Dash Cooldown - but no catch")
#			pass
#		pass
#	elif ctr >= stats.DASH_FRAME_COOL:
#		# Post Cooldown Checks
#		if LS_MAP["TurnSmash"].has_region():
#			return stateTurnSmash
#
#		elif LS_MAP["TurnTilt"].has_region():
#			return stateTurnTilt
#
#		elif LS_MAP["WalkBack"].has_region():
#			return stateWalkBack
#
#		elif LS_MAP["Dash"].has_region():
#			return stateDash
#
#		elif LS_MAP["Run"].has_region():
#			return stateRun
#
#		elif LS_MAP["WalkSlow"].has_region():
#			return stateWalkSlow
#
#		elif LS_MAP["Squat"].has_region():
#			return stateSquat
#
#		elif LS_MAP["Idle"].has_region():
#			return stateIdle
#		else:
#			util.debug("Dash Cooldown - but no catch")
#			pass
#		pass
#	else:
#		# Glitch Grabber
#		pass
#
#
#	return null
