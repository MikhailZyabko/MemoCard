extends Node3D

var enemy_pool_size = 10
var enemy_node: Node
var enemy_pool: Array
var spawn_interval = 2.0
var last_spawn_time = 0.0

func _ready():
	enemy_pool = Array()
	for i in range(enemy_pool_size):
		var enemy = enemy_node.duplicate()
		enemy.set_process(false)
		add_child(enemy)
		enemy_pool.append(enemy)
	
func _process(delta):
	if Time.get_ticks_msec() / 1000.0 - last_spawn_time > spawn_interval:
		last_spawn_time = Time.get_ticks_msec() / 1000.0
		spawn_enemy()
	
func spawn_enemy():
	var enemy = get_enemy_from_pool()
	# Реализовать логику места спавна
	
func get_enemy_from_pool():
	if enemy_pool.size() > 0:
		var enemy = enemy_pool[0]
		enemy_pool.remove_at(0)
		enemy.set_process(true)
		return enemy
	else:
		return null
	
func return_enemy_to_pool(enemy):
	enemy.set_process(false)
	enemy_pool.append(enemy)
