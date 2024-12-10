extends Node

# General Properties
const CHARACTER_NAME = "Capsule"

var parent

# Mechanic Properties

# Variable Stats
func speed_x() -> float:
	return abs(parent.velocity.x)
	
func speed_y() -> float:
	return abs(parent.velocity.y)

# Base Stats
#const AMT_ROTATION = 3.14159

## Gen Gr Movement
const TRACTION = -0.1*10
const FRAME_TURN_STEP = 12

## Idle
const CTR_IDLE = 60
const IDLE_SPEED_MAX = 0.0

## Walk-Based
const FRAME_PRE_DASH_STEP = 1

### Forwards
const WALK_SPEED_MAX = 1.50*10
const WALK_ACCEL_SCALE = 0.1*10
const WALK_ACCEL_BASE = 0.1*10

### Backwards
const WALK_BACK_SPEED_MAX = 1.00*10
const WALK_BACK_ACCEL_SCALE = 0.1*10
const WALK_BACK_ACCEL_BASE = 0.1*10


## Falling
const GRAVITY = -0.15*10
const FALL_SPEED_MAX = -2.0*10
const FALL_FAST_SPEED_MAX = -3.5*10

## Landing
const LAND_RECOVERY = 4

## Dash-Based
### Move Stats
const DASH_SPEED_MAX = 2.50*10
const DASH_SPEED_INIT = 2.0*10
const ACCEL_DASH_SCALE = 0.015*10
const ACCEL_DASH_BASE = 0.01*10
### Frame Stats
const DASH_FRAME_PRE = 3
const DASH_FRAME_PRIME = 15 + DASH_FRAME_PRE
const DASH_FRAME_SEC = 4 + DASH_FRAME_PRIME
const DASH_FRAME_COOL = 9 + DASH_FRAME_SEC
	
#
### Run-Based
##const RUN_SPEED_MAX = 2.5*10
#const RUN_SPEED_MAX = 2.50*10
#const RUN_SPEED_INIT = 2.0*10
#const ACCEL_RUN_SCALE = 0.015*10
#const ACCEL_RUN_BASE = 0.05*10
#
### Jump-Based
#const JUMP_SHORT_INIT = 2.0*10
#const JUMP_FULL_INIT = 3.5*10
#
#const JUMP_SUPER_INIT = ( JUMP_SHORT_INIT + JUMP_FULL_INIT )/2
##const JUMP_SUPER_INIT = 2.0*10
##const JUMP_SUPER_SCALE = 0.2*10
#const JUMP_SUPER_SCALE = ( JUMP_FULL_INIT - JUMP_SUPER_INIT )/4
#
### Fall
#const GRAVITY = -0.13*10
#const FALL_MAX = -2.9*10
#const FALL_FAST_MAX = -3.5*10
#
### Skid-Based
#const SKID_SPEED_MAX = WALK_SPEED_MAX
#
#var is_facing_right = true
#
## Max Frame Values
### Dash
#const FRAME_DASH_STEP = 3
#const FRAME_DASH_PRIME = 15 + FRAME_DASH_STEP
#const FRAME_DASH_SEC = 4 + FRAME_DASH_PRIME
#const FRAME_DASH_COOL = 9 + FRAME_DASH_SEC
#
### Turns
#const FRAME_TURN_STEP = 0
#const FRAME_TURN_STAND = 12
#
#const FRAME_TURN_RUN_PRIME = 5
#const FRAME_TURN_RUN_SEC = 1
#const FRAME_TURN_RUN_TERT = 3
#
### Walks
#const FRAME_PRE_DASH_STEP = 1
#
### Skid
#const FRAME_SKID_BFR = 4
#
### Squat Times
#const FRAME_SQUAT = 8
#const FRAME_SQUAT_RV = 10
#
### Jump Squat Times
#const FRAME_JUMP = 4
#const FRAME_JUMP_SUPER = 7
#
## State-to-State Variables
#var charge_jumpSuper
#
### Controller Sensitivities
##const REGION_PADDING = 0.0125
##const INPUT_FUZZ = REGION_PADDING/4
