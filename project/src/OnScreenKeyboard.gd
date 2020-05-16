extends Control

signal number_pressed(number)
signal backspace_pressed
signal ok_pressed


func _ready():
	var buttons = _get_all_buttons()
	for button in buttons:
		button.connect('pressed', self, '_on_number_button_clicked', [button])

	
func _get_all_buttons():
	var rows = [$VBoxContainer/Row1, $VBoxContainer/Row2]
	var buttons = []
	for row in rows:
		for child in row.get_children():
			buttons.append(child)
	return buttons


func _on_number_button_clicked(button):
	emit_signal('number_pressed', button.text)


func _on_BackspaceButton_pressed():
	emit_signal("backspace_pressed")


func _on_CommitButton_pressed():
	emit_signal("ok_pressed")
