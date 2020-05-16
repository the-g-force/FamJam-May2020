extends Label

const LAST_ROOM := 10

var current_room : int = 1

func _ready():
	_update_text()


func _update_text():
	text = "Room\n%d of %d" % [current_room, LAST_ROOM]
	

func advance():
	current_room += 1
	_update_text()
	
	
func is_at_end() -> bool:
	return current_room == LAST_ROOM
	
