extends Node

export (bool) var finished = false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		finished = true
