extends Node

onready var _text : Label = $Label
var _answer : String = ""
var _problem_text : String = ""
var _operator : String = ""
var problem
var type : int
var _first_digit : int
var _second_digit : int

func generate():
	randomize()
	type = int(round(rand_range(1,4)))
	_first_digit = int(round(rand_range(1,10)))
	_second_digit = int(round(rand_range(1,10)))
	if type == 1:
		problem = _first_digit*_second_digit
		_operator = " x "
	elif type == 2:
		problem = _first_digit+_second_digit
		_operator = " + "
	elif type == 3:
		problem = _first_digit
		_first_digit *= _second_digit
		_operator = "/"
	elif type == 4:
		problem = _first_digit
		_first_digit += _second_digit
		_operator = " - "
	_problem_text = str(_first_digit) + _operator + str(_second_digit) + " = "
	_text.text = _problem_text

func _ready():
	generate()
