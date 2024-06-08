extends BulletWeapon 

class_name AutoBulletWeapon

func pull_triger(scene:SceneTree):
	if oncooldown: return
	super.pull_triger(scene)
	while isfiring:
		shoot_bullet(scene)
		var t = scene.create_timer(cooldown)
		await t.timeout
