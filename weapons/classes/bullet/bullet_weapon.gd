extends Weapon

class_name BulletWeapon

@export var bullet:PackedScene

func pull_triger(scene:SceneTree):
	setcooldown(scene)
	isfiring = true

func release_triger():
	isfiring = false

func shoot_bullet(scene:SceneTree):
	var new_bullet = bullet.instantiate()
	var angle = randf_range(-spread_angle/2, spread_angle/2)
	scene.root.add_child(new_bullet)
	new_bullet.global_position = originpos
	new_bullet.global_rotation = originrotate
	new_bullet.rotate_y(deg_to_rad(angle))
