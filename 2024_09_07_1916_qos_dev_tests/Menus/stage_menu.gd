extends Control

@export var prior_menu = "res://Menus/training_menu.tscn"

func _ready():
	$MarginContainer/HSplitContainer/IconHolder/GridContainer/ThePit.grab_focus()






func _on_prior_menu_pressed():
	get_tree().change_scene_to_file(prior_menu)



func _on_the_pit_pressed():
	get_tree().change_scene_to_file("res://Stages/ThePit.tscn")


func _on_battle_farm_pressed():
	get_tree().change_scene_to_file("res://Stages/BattleFarm.tscn")


func _on_final_desire_pressed():
	get_tree().change_scene_to_file("res://Stages/FiniteDesire.tscn")


func _on_pressure_segway_pressed():
	get_tree().change_scene_to_file("res://Stages/PressureSegway.tscn")


func _on_sommersville_pressed():
	get_tree().change_scene_to_file("res://Stages/Sommersville.tscn")


func _on_virtual_villa_pressed():
	get_tree().change_scene_to_file("res://Stages/VirtualVilla.tscn")
