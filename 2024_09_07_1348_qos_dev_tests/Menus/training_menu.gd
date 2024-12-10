extends Control



func _ready():
	$MarginContainer/VBoxContainer/OpenLab.grab_focus()



func _on_open_lab_pressed():
	get_tree().change_scene_to_file("res://Menus/stage_menu.tscn")


func _on_tutorials_pressed():
	pass # Replace with function body.


func _on_exercises_pressed():
	pass # Replace with function body.


func _on_review_pressed():
	pass # Replace with function body.


func _on_prior_menu_pressed():
		get_tree().change_scene_to_file("res://Menus/local_menu.tscn")
