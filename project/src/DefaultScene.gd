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

func _ready():
	_trap.animation = str(_problem.type)


func _on_OnScreenKeyboard_number_pressed(number):
	_answer.add_character(number)


func _on_OnScreenKeyboard_backspace_pressed():
	_answer.backspace()


func _on_OnScreenKeyboard_ok_pressed():
	if _answer.text == str(_problem.problem):
		_feedback.text = "SUCCESS \n You disable the trap and pass through safely."
		_feedback_animatior.play("WIN")
	else:
		_feedback.text = "FAIL \n You fail to disable the trap. As you pass, it triggers."
		_feedback_animatior.play("LOSE")
		$HealthTracker.health -= 1
	$OnScreenKeyboard.disabled = true


func _on_AnimationPlayer_animation_finished(_anim_name):
	if _room_tracker.is_at_end():
		var _ignored = get_tree().change_scene_to(WinScene)
	else:
		_room_tracker.advance()
	$OnScreenKeyboard.disabled = false
	_answer.text = ""
	if $HealthTracker.health > 0:
		_problem.generate()
		print(str(_problem.type))
		_trap.animation = str(_problem.type)
	else:
		var _ignored = get_tree().change_scene_to(_death_scene)
