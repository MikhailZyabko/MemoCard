extends Node
	
@export var enemy_pool_size = 10
@export var enemy_node: Node
@export var initial_spawn_interval = 2.0
@export var spawn_interval_decrease_rate = 0.05
@export var spawner_node: Node

var enemy_pool: Array
var last_spawn_time = 0.0
var current_spawn_interval = 0.0
	
func _ready():
	enemy_pool = Array()
	for i in range(enemy_pool_size):
		var enemy = enemy_node.duplicate()
		enemy.set_process(false)
		add_child(enemy)
		enemy_pool.append(enemy)
	
	current_spawn_interval = initial_spawn_interval
	
func _process(delta):
	if Time.get_ticks_msec() / 1000.0 - last_spawn_time > current_spawn_interval:
		last_spawn_time = Time.get_ticks_msec() / 1000.0
		spawn_enemy()
		current_spawn_interval -= spawn_interval_decrease_rate
	
func spawn_enemy():
	var enemy = get_enemy_from_pool()
	if enemy:
		enemy.position = spawner_node.position
	
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
