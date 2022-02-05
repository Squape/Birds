extends Area2D

var floor_hits = 0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is TileMap:
			floor_hits = floor_hits + 1
			if floor_hits == 2:
				print("lost")
