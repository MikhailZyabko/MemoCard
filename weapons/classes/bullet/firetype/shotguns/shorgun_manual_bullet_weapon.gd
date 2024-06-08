extends ManualBulletWeapon

class_name ShotgunManualBulletWeapon

@export var bulletcount:int = 1

func pull_triger(scene:SceneTree):
	super.pull_triger(scene)

func fire(scene:SceneTree)->void:
	for t in bulletcount:
		shoot_bullet(scene)
