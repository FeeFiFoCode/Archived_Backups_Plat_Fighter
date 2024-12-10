extends Control

func _ready():
	$MarginContainer/VBoxContainer/Local.grab_focus()

func _on_local_pressed():
	get_tree().change_scene_to_file("res://Menus/local_menu.tscn")

func _on_online_pressed():
	pass # Replace with function body.

func _on_options_pressed():
	pass # Replace with function body.

func _on_extras_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
