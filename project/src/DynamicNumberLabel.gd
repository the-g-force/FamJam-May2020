extends Control

onready var _answer : Label = $Label
signal answer_changed(answer)


func _on_OnScreenKeyboard_number_pressed(number):
	_answer.text += str(number)
	emit_signal("answer_changed", _answer.text)
