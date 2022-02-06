extends Button

func _ready():
	JavaScript.eval("alert('If you just see green solid color or the game is not working, disable your adblocker')")

func _on_Button_pressed():
	get_node("../AnimationPlayer").play("fade_to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		get_tree().change_scene("res://Scenes/" + "Level 1" + ".tscn")
