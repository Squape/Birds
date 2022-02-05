extends Node

func _physics_process(delta):
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body is KinematicBody2D:
			print("[Game] Killed enemy")
			$Particles2D.emitting = true
			$Sprite.queue_free()
			$CollisionShape2D.queue_free()
			$Area2D/CollisionShape2D.queue_free()
