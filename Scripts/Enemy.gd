extends Node

var rng = RandomNumberGenerator.new()
var random

func _physics_process(delta):
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body is KinematicBody2D:
			print("[Game] Killed enemy")
			$Particles2D.emitting = true
			rng.randomize()
			random = str(rng.randi_range(1, 8))
			get_node("Sounds/Explosion " + random).play()
			$Sprite.queue_free()
			$CollisionShape2D.queue_free()
			$Area2D/CollisionShape2D.queue_free()
