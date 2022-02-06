extends Node

export (String) var next_level

var what_to_do

func finished_animation(anim_name):
	print("[Game] Finished animation: " + anim_name)
	if anim_name == "fade_to_black" and what_to_do == "next":
		get_tree().change_scene("res://Scenes/" + next_level + ".tscn")
	if anim_name == "fade_to_black" and what_to_do == "reset":
		get_tree().reload_current_scene()

func reset():
	what_to_do = "reset"
	$CanvasLayer/AnimationPlayer.play("fade_to_black")

func next():
	what_to_do = "next"
	$CanvasLayer/AnimationPlayer.play("fade_to_black")

func _ready():
	$CanvasLayer/ColorRect.visible = true
	$CanvasLayer/AnimationPlayer.play("fade_to_normal")
	$"CanvasLayer/Retry Button".connect("pressed", self, "reset")
	$"CanvasLayer/Next Button".connect("pressed", self, "next")
	$"CanvasLayer/AnimationPlayer".connect("animation_finished", self, "finished_animation")

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		reset()
	if Input.is_action_just_pressed("next") and $"CanvasLayer/Next Button".visible:
		next()
