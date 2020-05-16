extends Control

onready var MainMenu = preload("TitleScene.tscn");

func _on_MainMenuButton_pressed():
	get_tree().change_scene_to(MainMenu)
