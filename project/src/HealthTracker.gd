extends HBoxContainer
class_name HealthTracker

export var health := 3 setget _set_health

var _hearts = []

onready var heart_image := preload("res://assets/heart.png")

func _ready():
	_update_ui()


func _update_ui() -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	for _i in range(0,health):
		var heart = TextureRect.new()
		heart.texture = heart_image
		add_child(heart)


func _set_health(value):
	health = value
	_update_ui()
