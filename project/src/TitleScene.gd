extends Control

var GameScene := preload("res://src/DefaultScene.tscn")
var CreditsScene := preload("res://src/CreditsScene.tscn")

func _ready():
	Jukebox.play_game_music()


func _on_StartButton_pressed():
	var _ignored = get_tree().change_scene_to(GameScene)


func _on_FullscreenButton_pressed():
	OS.window_fullscreen = not OS.window_fullscreen


func _on_CreditsButton_pressed():
	var _ignored = get_tree().change_scene_to(CreditsScene)
