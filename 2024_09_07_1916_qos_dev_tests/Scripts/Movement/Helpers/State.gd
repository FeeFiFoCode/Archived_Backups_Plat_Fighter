class_name State
extends Node

var util = utility.new()
var input

# Hold Reference to Parent so it can be controlled by the state
var parent : CharacterBody3D

# Hold Parent Stats
var stats : Node

# Hold Movement Utility
var mover : Node

var is_meta = false
## Input Map
#var LS_MAP

#@export
#var animation_name : String

#func _init() -> void:
#	util.debug("Initialization")

@export
var state_name : String

#func _ready():
##	print(state_name)
##	print(name)
#	util.debug(state_name + ": is ready")
	
#@onready
#var LS_MAP = StickMap.new().LeftStick[state_name]
	

# Key State Functions

## On Entry to State
func enter() -> void:
## Animation Here
#	if animation_name:
#		parent.animations.play(animation_name)
#	else:
#		parent.animations.play("poseT")
#		util.debug("No animation")
	
	print("Just entered: ",name)
	pass

## On Exit of State
func exit() -> void:
	print("Just exited: ",name)
	pass

func process_input(event : InputEvent ) -> State:
#	if input.controller_type == "MIDI_Keybord":
#		if event is InputEventMIDI:
#			print("Debug - _State.gd: controller_type:",input.controller_type)
#			input.process_midi(event)
#		else:
#			pass
#
#	else:
#		pass
	return null

func process_frame(delta : float ) -> State:
	return null
	
func process_physics( delta : float ) -> State:
	return null
