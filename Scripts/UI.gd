extends Node

func reset():
	get_tree().reload_current_scene()

func _ready():
	$CanvasLayer/Button.connect("pressed", self, "reset")
