class_name MetaState
extends Node

var util = utility.new()
var is_meta = true

@onready
var parent = get_parent()

func init() -> void:
	parent = parent.parent
#	util.debug("Begins Meta Test Init")
	
	for child in get_children():
		if child.is_meta:
#			util.debug("This child is meta: " + child.name)
			
			pass
			
		else:
#			util.debug("This is the child name: " + child.name)
			
			child.parent = parent
			child.input = parent.input
			child.stats = parent.stats
			child.mover = parent.mover
			
			pass
	
#	util.debug("Finish Meta Test Init")
