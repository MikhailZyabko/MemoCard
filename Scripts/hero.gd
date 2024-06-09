extends CharacterBody3D

@onready var camera = $camera
@onready var hero = $hero
@onready var wc = $hero/body/weapon_control

@export var speed = 50.0

var target_velocity = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = hero.global_transform.origin
	var drop_plane = Plane(Vector3(0,1,0), player_pos.y)
	var ray_length = 1000
	var mouse_pos = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var cursor_pos = drop_plane.intersects_ray(from, to)
	hero.look_at(cursor_pos, Vector3.UP)
	
	if Input.is_action_just_pressed("ui_accept"):
		wc.start_firing()
	if Input.is_action_just_released("ui_accept"):
		wc.stop_firing()
	
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	velocity = target_velocity
	move_and_slide()
