extends Control

onready var _answer : Label = $Label


func _on_OnScreenKeyboard_number_pressed(number):
	_answer.text += str(number)
