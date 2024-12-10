extends Node

@onready
var parent = get_parent()

@export
var starting_state : State

var current_state : State

var previous_state : State

var util = utility.new()
#var debugString = "Debug - StateMachine.gd: "
#var debugString = "Debug :: " +  get_script().get_path() + ": "

# Initialize the State Machine by giving each child state a reference to the parent object
# it belongs to and enter the defualt state
func init() -> void:
	util.debug("Begins SM Init")
	
	for child in get_children():
		if child.is_meta:
			print("This child is the meta: ",child.name)
			child.init()
			
		else:
	#		util.debug("This is the child: " + str(child))
			child.parent = parent
			child.input = parent.input
			child.stats = parent.stats
			child.mover = parent.mover
	#		child.LS_MAP = StickMap.new().LeftStick[child.name]
	#		child.move_component = move_component
		

	# Initialize to the Default State
	change_state(starting_state)
	util.debug("End SM Init")
	
func _ready():
	util.debug("Begin SM Ready")
	util.debug("End SM Ready")

func change_state(new_state : State ) -> void:
	if current_state:
		current_state.exit()
	
	previous_state = current_state
	current_state = new_state
	current_state.enter()
	
# Passthrough Functions for each state to call
func process_physics( delta: float ) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input( event: InputEvent ) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)
		
func process_frame( delta: float ) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
