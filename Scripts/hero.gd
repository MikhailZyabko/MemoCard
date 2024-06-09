extends Node3D

@onready var camera = $camera
@onready var hero = $hero
@onready var wc = $hero/body/weapon_control


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
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		translate(direction * 5 * delta)
