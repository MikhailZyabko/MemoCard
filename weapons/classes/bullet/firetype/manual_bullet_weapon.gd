extends BulletWeapon

class_name ManualBulletWeapon

func pull_triger(scene:SceneTree):
	if oncooldown: return
	super.pull_triger(scene)
	fire(scene)

func fire(scene:SceneTree)->void:
	shoot_bullet(scene)
