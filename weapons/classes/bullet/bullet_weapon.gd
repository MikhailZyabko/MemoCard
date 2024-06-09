extends Weapon

class_name BulletWeapon

@export var bullet:PackedScene
@export var bulletPoolSize:int

var bulletPool:ObjectPool = ObjectPool.new()

func initialize():
	bulletPool.scene = bullet
	bulletPool.add(bulletPoolSize)

func pull_triger(scene:SceneTree) -> void:
	if oncooldown: return
	setcooldown(scene)

func release_triger() -> void:
	pass

func shoot_bullet(scene:SceneTree):
	var new_bullet = bulletPool.instantiate()
	var angle = randf_range(-spread_angle/2, spread_angle/2)
	if not new_bullet.get_parent():
		scene.root.add_child(new_bullet)
	new_bullet.global_position = originpos
	new_bullet.global_rotation = originrotate
	new_bullet.rotate_y(deg_to_rad(angle))
	new_bullet.pool = bulletPool
	new_bullet.poolready()
