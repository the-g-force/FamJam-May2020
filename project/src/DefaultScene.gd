extends Control

var _problem

func _on_OnScreenKeyboard_number_pressed(number):
	# For now, just echo the key to the console to show it works
	print(number)


func _on_Control_answer_changed(answer):
	_problem = $ProblemGenerator.problem
	if answer == str(_problem):
		print("Yay")
