extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/Battle.grab_focus()



func _on_battle_pressed():
	pass # Replace with function body.


func _on_arena_pressed():
	pass # Replace with function body.


func _on_special_pressed():
	pass # Replace with function body.


func _on_custom_pressed():
	pass # Replace with function body.


func _on_prior_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/local_menu.tscn")
