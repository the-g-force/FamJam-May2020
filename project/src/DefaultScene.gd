extends Control

var _death_scene := preload("res://src/DeathScene.tscn")
var WinScene := preload("res://src/WinScene.tscn")

onready var _answer : Answer = $HBoxContainer/Answer
onready var _problem = $HBoxContainer/ProblemGenerator
onready var _feedback : Label = $Label
onready var _feedback_animatior : AnimationPlayer = $AnimationPlayer
onready var _trap = $art
onready var _room_tracker := $RoomTracker
onready var _sfx := $AudioStreamPlayer
onready var _osk := $OnScreenKeyboard
onready var _health_tracker := $HealthTracker

func _ready():
	_trap.animation = str(_problem.type)
	_osk.set_allow_confirmation(false)


func _on_OnScreenKeyboard_number_pressed(number):
	_answer.add_character(number)
	_osk.set_allow_confirmation(true)


func _on_OnScreenKeyboard_backspace_pressed():
	_answer.backspace()
	_osk.set_allow_confirmation(not _answer.text == "")


func _on_OnScreenKeyboard_ok_pressed():
	if _answer.text == str(_problem.problem):
		_feedback.text = "SUCCESS \n You disable the trap and pass through safely."
		_feedback_animatior.play("WIN")
	else:
		_feedback.text = "FAIL \n You fail to disable the trap. As you pass, it triggers."
		_feedback_animatior.play("LOSE")
		_health_tracker.health -= 1
	_osk.disabled = true


func _on_AnimationPlayer_animation_finished(_anim_name):
	if _room_tracker.is_at_end():
		var _ignored = get_tree().change_scene_to(WinScene)
	else:
		_room_tracker.advance()
	_osk.disabled = false
	_answer.text = ""
	if _health_tracker.health > 0:
		_problem.generate()
		_osk.set_allow_confirmation(false)
		_trap.animation = str(_problem.type)
	else:
		var _ignored = get_tree().change_scene_to(_death_scene)
