extends Node2D

onready var cloud_entity = preload("res://objects/World/Cloud_Entity.tscn")
onready var LSP = $LSpawner
onready var RSP = $RSpawner

func _ready():
	randomize()
	start_timer()

func start_timer():
	$Spawntimer.start(rand_range(2,5))

func random_speed(cloud):
	cloud.speed = randi()% 30 + 10

func random_pos(cloud):
	cloud.position.y = rand_range(-25,45)

func random_sprite(cloud):
	cloud.get_node('Sprite').set_frame(randi()%4)

func random_dir(cloud):
	cloud.facing = randi()% 2

func update_cloud(cloud):
	print('cloud data update')
	random_speed(cloud)
	random_dir(cloud)
	random_sprite(cloud)
	random_pos(cloud)

func spawn_cloud():
	var cloud = cloud_entity.instance()
	update_cloud(cloud)
	match cloud.facing:
		0:
			print('left cloud')
			cloud.speed = cloud.speed * -1
			LSP.add_child(cloud)
		1:
			print('right cloud')
			cloud.speed = cloud.speed * -1
			RSP.add_child(cloud)

func _on_Spawntimer_timeout():
	print('timeout')
	spawn_cloud()
	start_timer()
