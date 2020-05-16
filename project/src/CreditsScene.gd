extends Control

func _ready():
	Jukebox.play_credits_music()

func _on_MainMenuButton_pressed():
	var mainmenu = load("res://src/TitleScene.tscn")
	var _ignored = get_tree().change_scene_to(mainmenu)
