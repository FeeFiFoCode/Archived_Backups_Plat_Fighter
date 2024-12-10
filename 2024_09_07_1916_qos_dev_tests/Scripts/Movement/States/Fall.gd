extends State

# Regions
#var regionDeadzone = Region.new(Vector2(-0.2750,-0.6500), Vector2(0.2750,0.6500) )
#var regionWalkSlow = Region.new(Vector2(0.2875,-0.6500), Vector2(0.7875,0.6500))
#
#var regionTiltTurn = Region.new(Vector2(-0.7875,-0.6500), Vector2(-0.2875,0.6500))
#
#var regionDash = Region.new(Vector2(0.8000,-0.6500),Vector2(1.000,0.6500))
#var regionDashBack = Region.new(Vector2(-1.000,-0.6500),Vector2(-0.8000,0.6500))
#
#var regionJumpSquat = Region.new(Vector2(-1.000,0.6625),Vector2(1.000,1.000))
#var regionSquat = Region.new(Vector2(-0.7875,-1.000),Vector2(0.7875,-0.6625))

@export
var stateFall : State

@export
var stateLand : State


var accelApplied = 0

#var fall_kind_max = stats.FALL_SPEED_MAX
#var fall_kind_max = stats.FALL_SPEED_MAX



func process_physics( delta : float ) -> State:
#	print(debugString,"Current Fall Speed: ",parent.velocity.y)

	if parent.is_on_floor():
		return stateLand

#	input_vector = input.get_region_left_stick()
##

#	# Check if accelerating will cross 0.
#	## If it does not, then just acceelerate as normal.
#	## If it does, then just set velocity to 0.
#
	if parent.velocity.y + stats.GRAVITY < stats.FALL_SPEED_MAX:
		parent.velocity.y = stats.FALL_SPEED_MAX
	else:
		parent.velocity.y += stats.GRAVITY

	parent.move_and_slide()

	return null
