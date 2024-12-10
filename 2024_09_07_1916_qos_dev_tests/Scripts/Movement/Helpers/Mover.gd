extends Node

var util = utility.new()
var parent
var stats
var target_speed
# Mechanic Properties

# Variable Stats

var accel

func ground_speed_up_1(movement,stickX) -> float:
	# Idle
	## This should never run since it should only be called in the instance of "negative speed"
	## This is because target_speed should always be 0 for this in the appropriate Idle.gd script
	if movement in ["Idle"]:
		accel = stats.IDLE_ACCEL_BASE
		target_speed = 0.0
		
		# Handling Overshooting
		if stats.speed_x() + accel >= target_speed:
			accel = target_speed - stats.speed_x()
		
	# Walk Forward
	elif movement in ["WalkSlow","WalkMid","WalkFast"]:
		accel = stats.WALK_ACCEL_BASE + stickX*stats.WALK_ACCEL_SCALE
		target_speed = stickX * stats.WALK_SPEED_MAX
		
		accel *= 0.5 * ( 1 - stats.speed_x()/ target_speed )
		
		# Handle Overshooting
		if stats.speed_x() + accel >= target_speed:
			accel = target_speed - stats.speed_x()

	# Walk Back
	elif movement in ["WalkBack"]:
		accel = stats.WALK_BACK_ACCEL_BASE + stickX*stats.WALK_BACK_ACCEL_SCALE
		target_speed = stickX * stats.WALK_BACK_SPEED_MAX		
		
		accel *= 0.5 * ( 1 - stats.speed_x()/ target_speed )
		
		# Handle Overshooting
		if stats.speed_x() + accel >= target_speed:
			accel = target_speed - stats.speed_x()
			
		accel *= -1

	else:
		util.debug("Unrecognized Movement Option")
		accel = 0
		
	return accel

func ground_slow_down_1(movement,stickX) -> float:
	# Idle
	if movement in ["Idle"]:
		accel = stats.TRACTION
		target_speed = 0.0
		
		# Handling Overshooting
		if stats.speed_x() + accel <= target_speed:
			accel = target_speed - stats.speed_x()
			
	# Walk Forward
	elif movement in ["WalkSlow", "WalkMid", "WalkFast" ]:
		accel = stats.TRACTION
		target_speed = stickX * stats.WALK_SPEED_MAX
		
		# Handle Overshooting
		if stats.speed_x() + accel <= target_speed:
			accel = target_speed - stats.speed_x()

	# Walk Back
	elif movement in ["WalkBackSlow","WalkBackMid","WalkBackFast","WalkBack"]:
		accel = stats.TRACTION
		target_speed = stickX * stats.WALK_BACK_SPEED_MAX
		
		# Handle Overshooting
		if stats.speed_x() + accel <= target_speed:
			accel = target_speed - stats.speed_x()
			
		accel *= -1
	else:
		util.debug("Unrecognized Movement Option")
		accel = 0

	return accel
	
func ground_halt_1(movement,stickX) -> float:
	# Idle
	if movement in ["Idle"]:
		accel = 2*stats.TRACTION
		target_speed = 0.0
		
		# Handling Overshooting
		if stats.speed_x() + accel <= target_speed:
			accel = target_speed - stats.speed_x()

	elif movement in ["WalkSlow", "WalkMid", "WalkFast" ]:
		accel = 2*stats.TRACTION
		target_speed = stickX * stats.WALK_SPEED_MAX
		
		# Handle Overshooting
		if stats.speed_x() + accel < target_speed:
			accel = target_speed - stats.speed_x()

	# Walk Back
	elif movement in ["WalkBackSlow","WalkBackMid","WalkBackFast","WalkBack"]:
		accel = 2*stats.TRACTION
		target_speed = stickX * stats.WALK_BACK_SPEED_MAX
		
		# Handle Overshooting
		if stats.speed_x() + accel > target_speed:
			accel = target_speed - stats.speed_x()

		accel *= -1
	else:
		util.debug("Unrecognized Movement Option")
		accel = 0
	return accel

func ground_to_rewind(movement,stickX) -> float:
	# Idle
	if movement in ["Idle"]:
		accel = 2*stats.TRACTION
		target_speed = 0.0
		
		# Handling Overshooting
		if stats.speed_x() + accel <= target_speed:
			accel = target_speed - stats.speed_x()
	
		accel *= -1
	elif movement in ["WalkSlow", "WalkMid", "WalkFast" ]:
		accel = 2*stats.TRACTION
		target_speed = stickX * stats.WALK_SPEED_MAX
		
		accel *= -1
#		# Handle Going Wrong Direction
#		if stats.speed_x() - accel >= 0:
#			accel = stats.speed_x()

	# Walk Back
	elif movement in ["WalkBackSlow","WalkBackMid","WalkBackFast","WalkBack"]:
		accel = 2*stats.TRACTION
		target_speed = stickX * stats.WALK_BACK_SPEED_MAX
		

#		# Handle Overshooting
#		if stats.speed_x() + accel <= 0:
#			accel = -1*stats.speed_x()
			
	else:
		util.debug("Unrecognized Movement Option")
		accel = 0
	return accel
