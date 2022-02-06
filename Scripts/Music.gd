extends Node

func _process(delta):
	if $Music.playing == false:
		$Music.playing = true
