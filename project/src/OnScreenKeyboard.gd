extends Control

signal number_pressed(number)

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
