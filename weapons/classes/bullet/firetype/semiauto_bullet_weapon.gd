extends BulletWeapon

class_name SemiautoBulletWeapon

@export var count:int
@export var between_cooldown:float

func pull_triger(scene:SceneTree):
	if oncooldown: return
	super.pull_triger(scene)
	var curr_count = count
	while curr_count:
		shoot_bullet(scene)
		var t = scene.create_timer(between_cooldown)
		await t.timeout
		curr_count -= 1
