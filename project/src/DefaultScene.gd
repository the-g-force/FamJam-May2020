extends Control

var _death_scene := preload("res://src/DeathScene.tscn")

onready var _answer : Answer = $HBoxContainer/Answer
onready var _problem = $HBoxContainer/ProblemGenerator
onready var _feedback : Label = $Label
onready var _feedback_animatior : AnimationPlayer = $AnimationPlayer


func _on_OnScreenKeyboard_number_pressed(number):
	_answer.add_character(number)


func _on_OnScreenKeyboard_backspace_pressed():
	_answer.backspace()


func _on_OnScreenKeyboard_ok_pressed():
	if _answer.text == str(_problem.problem):
		_feedback.text = "SUCCESS \n You disable the trap and pass through safely."
	else:
		_feedback.text = "FAIL \n You fail to disable the trap. As you pass, it triggers."
		$HealthTracker.health -= 1
	_feedback_animatior.play("WIN")
	$OnScreenKeyboard.disabled = true


func _on_AnimationPlayer_animation_finished(_anim_name):
	$OnScreenKeyboard.disabled = false
	_answer.text = ""
	if $HealthTracker.health > 0:
		_problem.generate()
	else:
		var _ignored = get_tree().change_scene_to(_death_scene)
