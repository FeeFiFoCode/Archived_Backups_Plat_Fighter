class_name utility
## Helper Var & Functions
#var is_debug = true
#
#func debug(msg) -> void:
#	if self.is_debug:
#		print("Debug " self.,":",msg)
#	else:
#		pass

const AMT_ROTATE = 3.14159

func debug(msg,is_debug=true) -> void:
	if is_debug:
		var debugString = "Debug :: " + self.get_script().get_path() + " : " + msg
		print(debugString)
	else:
		pass
