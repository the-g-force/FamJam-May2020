extends Control

var _problem

onready var answer_label : Answer = $Answer
onready var _feedback : Label = $Label
onready var _feedback_animatior : AnimationPlayer = $AnimationPlayer

func _on_OnScreenKeyboard_number_pressed(number):
	answer_label.add_character(number)


func _on_OnScreenKeyboard_backspace_pressed():
	answer_label.backspace()


func _on_OnScreenKeyboard_ok_pressed():
	if $Answer/Label.text == str($ProblemGenerator.problem):
		_feedback.text = "Yay"
	else:
		_feedback.text = "Boo"
	_feedback_animatior.play("WIN")
	$OnScreenKeyboard.disabled = true


func _on_AnimationPlayer_animation_finished(anim_name):
	$OnScreenKeyboard.disabled = false
