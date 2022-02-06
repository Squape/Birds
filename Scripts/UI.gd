extends Node

export (String) var next_level

func reset():
	get_tree().reload_current_scene()

func next():
	get_tree().change_scene("res://Scenes/" + next_level + ".tscn")

func _ready():
	$"CanvasLayer/Retry Button".connect("pressed", self, "reset")
	$"CanvasLayer/Next Button".connect("pressed", self, "next")

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		reset()
	if Input.is_action_just_pressed("next") and $"CanvasLayer/Next Button".visible:
		next()
