extends Control
class_name Answer

onready var _answer : Label = $Label
signal answer_changed(answer)


func add_character(number):
	_answer.text += str(number)
	emit_signal("answer_changed", _answer.text)


func backspace():
	var last_cha = _answer.text.length()
	_answer.text = _answer.text.substr(0, last_cha-1)
	emit_signal("answer_changed", _answer.text)
