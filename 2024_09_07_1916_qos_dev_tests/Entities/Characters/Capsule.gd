class_name Character
extends CharacterBody3D

@onready
var state_machine = $StateMachine

@onready
var stats = $Stats

@onready
var mover = $Mover

@onready
var body = $Model

#var debugString = "Debug :: " + get_script().get_path() + ": "

var util = utility.new()

#@onready
#var animations = $Model/AnimationPlayer

#@onready
#var body = $Model

@onready
var input = $InputContract

#@onready
#var active_input_contract = SingletonInputContract.active_contract


#@onready
#var _animations = $Model.AnimationPlayer
#@onready
#var state_machine_attack = $StateMachineAttack
#@onready
#var move_component: Node = $MoveComponent

var is_facing_right = true

func _ready() -> void:
#	util.debug("test",true)
#	util.debug("Capsule Ready - Starts SM Setup")
#	util.debug(stats.CHARACTER_NAME)

#	print(TestStaticData.itemData[character_name])
	
#	print(input)
#	print("Debugging: ",$InputContract)

#	print("DEBUG: First Check")
	# Initialize State Machine
	# Pass reference of the player to the states
	# Makes it easier for player to move and react accordingly
#	state_machine.init(self,move_component)
	state_machine.init()
	stats.parent = self
	mover.parent = self
	mover.stats = stats
#	util.debug("Capusle Ready - Gets Passed SM Setup")
#	state_machine_attack.init(self,move_component)
	
#	OS.open_midi_inputs()
#	print(OS.get_connected_midi_inputs())
	
#	input.set_script(load(active_input_contract))
#	print("DEBUG: Second Check")

func _unhandled_input(event: InputEvent ) -> void:
	state_machine.process_input(event)
#	state_machine_attack.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
#	state_machine_attack.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
