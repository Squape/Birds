extends Sprite

export (NodePath) var bird_path
onready var bird = get_node(bird_path)

func _process(delta):
	transform = Transform2D(0, Vector2(bird.transform[2][0], 300))
	scale = Vector2(7, 7)
