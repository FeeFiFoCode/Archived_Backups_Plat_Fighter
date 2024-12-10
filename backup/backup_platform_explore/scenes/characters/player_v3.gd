class_name _Player
extends CharacterBody3D

@onready
var _state_machine = $StateMachine
#@onready
#var state_machine_attack = $StateMachineAttack
#@onready
#var move_component: Node = $MoveComponent

# Stats
## Gen Gr Movement
const TRACTION = -0.06*10

## Walk-Based
const WALK_SPEED_MAX = 0.73*10
const ACCEL_WALK_SCALE = 0.08*10
const ACCEL_WALK_BASE = 0*10

## Dash-Based
const DASH_SPEED_MAX = 1.7*10
const DASH_SPEED_INIT = 1.5*10
const ACCEL_DASH_SCALE = 0.06*10
const ACCEL_DASH_BASE = 0

## Run-Based
const RUN_SPEED_MAX = 1.9*10
const ACCEL_RUN_SCALE = 0.07*10

var is_facing_right = true

# Max Frame Values
## Dash
const FRAME_DASH_STEP = 3
const FRAME_DASH_PRIME = 12
const FRAME_DASH_SEC = 7
const FRAME_DASH_COOL = 4

## Turns
const FRAME_TURN_STEP = 3
const FRAME_TURN_STAND = 12

const FRAME_TURN_RUN_PRIME = 27
const FRAME_TURN_RUN_SEC = 1
const FRAME_TURN_RUN_TERT = 3


func _ready() -> void:
#	print("DEBUG: First Check")
	# Initialize State Machine
	# Pass reference of the player to the states
	# Makes it easier for player to move and react accordingly
#	state_machine.init(self,move_component)
	_state_machine.init()
#	state_machine_attack.init(self,move_component)
	
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())
#	print("DEBUG: Second Check")

func _unhandled_input(event: InputEvent ) -> void:
	_state_machine.process_input(event)
#	state_machine_attack.process_input(event)
	
func _physics_process(delta: float) -> void:
	_state_machine.process_physics(delta)
#	state_machine_attack.process_physics(delta)

func _process(delta: float) -> void:
	_state_machine.process_frame(delta)
