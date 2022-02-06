extends KinematicBody2D

export var acceleration = 500
export var max_speed = 200
export var reverse_max_speed = 50
export var friction = 0.25
export var gravity = 100
export var jump_force = 100
export var bounce_force = 150

var motion = Vector2.ZERO
var x_input = 0

var can_move = false
var game_started = false

var floor_hits = 0

export var is_touching_floor = false

var rng = RandomNumberGenerator.new()

func jump(jump_force):
	motion.y = -jump_force
	can_move = true
	game_started = true

func _ready():
	$AnimatedSprite.animation = "Standing"

func _physics_process(delta):
	if can_move:
		x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	else:
		x_input = 0
	
	if x_input != 0:
		$AnimatedSprite.animation = "Gliding"
	
	if x_input != 0:
		motion.x += x_input * acceleration * delta
		motion.x = clamp(motion.x, -reverse_max_speed, max_speed)
	else:
		motion.x = lerp(motion.x, 0, friction)
	
	motion.y += gravity * delta
	
	if is_on_floor() and !game_started:
		if Input.is_action_just_pressed("ui_up"):
			$AnimatedSprite.animation = "Jumping"
			rng.randomize()
			get_node("Sounds/Jump " + str(rng.randi_range(1, 10))).playing = true
			jump(jump_force)

	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body is TileMap and game_started:
			floor_hits = floor_hits + 1
			if floor_hits == 4:
				print("[Game] Player lost")
				can_move = false
				$AnimatedSprite.animation = "Rekt"
				
		elif body is StaticBody2D and "Enemy" in body.name and $AnimatedSprite.animation != "Rekt":
			jump(bounce_force)
	
	motion = move_and_slide(motion, Vector2.UP)
