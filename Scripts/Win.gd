extends Area2D

export (NodePath) var bird_path

var win_time = 0

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is KinematicBody2D and get_node(bird_path).is_on_floor():
			win_time = win_time + 1
			if win_time == 1:
				print("[Game] Player won")
				$"Control/CanvasLayer/Next Button".visible = true
				$Win.playing = true
