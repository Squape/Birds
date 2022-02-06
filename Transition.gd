extends CanvasLayer

signal transitioned

export (bool) var finished

func _ready():
	transition()

func transition():
	$AnimationPlayer.play("fade_to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		finished = true
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
