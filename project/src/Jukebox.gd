extends Node

enum Song {
	NONE,
	GAME
}

const _SONG_MAP = {
	Song.GAME: preload("res://assets/dungeon_1.ogg")
}

onready var _music = $Music

var _song = Song.NONE


func play_game_music() -> void:
	_play(Song.GAME)


func _play(selection):
	if _song != selection:
		_music.stream = _SONG_MAP[selection]
		_song = selection
		if not _music.playing:
			_music.play()

