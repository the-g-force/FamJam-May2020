extends Control

var _problem

onready var answer_label : Answer = $Answer

func _on_OnScreenKeyboard_number_pressed(number):
	answer_label.add_character(number)


func _on_Control_answer_changed(answer):
	_problem = $ProblemGenerator.problem
	if answer == str(_problem):
		print("Yay")


func _on_OnScreenKeyboard_backspace_pressed():
	answer_label.backspace()


func _on_OnScreenKeyboard_ok_pressed():
	if $Answer/Label.text == str($ProblemGenerator.problem):
		print("Yay")
