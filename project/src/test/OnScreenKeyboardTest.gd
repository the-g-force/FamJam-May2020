extends Control

onready var keyboard = $OnScreenKeyboard


func _on_Button_pressed():
	keyboard.disabled = not keyboard.disabled
