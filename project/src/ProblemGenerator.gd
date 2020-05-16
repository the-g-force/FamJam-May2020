extends Node

onready var _text : Label = $Label
var _answer : String = ""
var _problem_text : String = ""
var _operator : String = ""
var problem
var _first_digit : int
var _second_digit : int

func generate():
	randomize()
	_first_digit = int(round(rand_range(1,10)))
	_second_digit = int(round(rand_range(1,10)))
	problem = _first_digit*_second_digit
	_operator = " x "
	_problem_text = str(_first_digit) + _operator + str(_second_digit) + " = "
	_text.text = _problem_text

func _ready():
	generate()
