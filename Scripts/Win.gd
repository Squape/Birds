extends Area2D

export (int) var next_level
export (NodePath) var bird_path

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is KinematicBody2D and get_node(bird_path).is_on_floor():
			print("[Game] Player won")
			$"Control/CanvasLayer/Next Button".visible = true
