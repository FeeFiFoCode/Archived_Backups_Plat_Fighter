extends Control

func _ready():
	$MarginContainer/VBoxContainer/Campaign.grab_focus()



func _on_campaign_pressed():
	pass # Replace with function body.



func _on_versus_pressed():
	get_tree().change_scene_to_file("res://Menus/versus_menu.tscn")


func _on_stadium_pressed():
	pass # Replace with function body.


func _on_training_pressed():
	get_tree().change_scene_to_file("res://Menus/training_menu.tscn")



func _on_prior_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
