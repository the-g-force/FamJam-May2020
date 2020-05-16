extends Control

var _problem
var _death_scene := preload("res://src/DeathScene.tscn")

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
		$HealthTracker.health -= 1
	_feedback_animatior.play("WIN")
	$OnScreenKeyboard.disabled = true


func _on_AnimationPlayer_animation_finished(_anim_name):
	$OnScreenKeyboard.disabled = false
	$Answer/Label.text = ""
	if $HealthTracker.health > 0:
		$ProblemGenerator.generate()
	else:
		var _ignored = get_tree().change_scene_to(_death_scene)
