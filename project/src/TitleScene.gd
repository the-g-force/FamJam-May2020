extends Control

onready var GameScene = preload("res://src/DefaultScene.tscn")

func _on_StartButton_pressed():
	get_tree().change_scene_to(GameScene)