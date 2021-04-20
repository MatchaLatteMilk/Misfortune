extends Node2D

enum{grass,home,dungeon}
var state setget set_state,get_state

onready var homeland_entity = preload("res://objects/World/Homeland.tscn")
onready var grassland_entity = preload("res://objects/World/Grassland.tscn")

onready var coin = $CanvasLayer/Gold
onready var energy = $CanvasLayer/Energy

var food_position_x:int
var gold:int
var food:int

func set_state(obj):
	state = obj

func get_state():
	return state

func _ready():
	$CanvasLayer/Map_Texture.hide()
	update_map_scene("homeland")

func _process(delta):
	update_resource()
	update_state()

func update_state():
	match state:
		home:
			pass
		grass:
			pass
		dungeon:
			pass

func update_resource():
	coin.text = str(gold)
	energy.text = str(food)
	coin.rect_size.x = str(gold).length()
	energy.rect_size.x = str(food).length()

func clear_map_scene():
	var map_scene = get_node("Scene").get_children()
	print(map_scene)
	if map_scene:
		for n in map_scene:
			n.queue_free()

func update_map_scene(scene):
	$CanvasLayer/Map_Texture.hide()
	clear_map_scene()
	match scene:
		"homeland":
			$CanvasLayer/Map_Texture/VBoxContainer/Homeland.disabled = true
			$CanvasLayer/Map_Texture/VBoxContainer/Grassland.disabled = false
			var homeland = homeland_entity.instance()
			get_node("Scene").add_child(homeland)
			set_state(home)
		"grassland":
			$CanvasLayer/Map_Texture/VBoxContainer/Homeland.disabled = false
			$CanvasLayer/Map_Texture/VBoxContainer/Grassland.disabled = true
			var grassland = grassland_entity.instance()
			get_node("Scene").add_child(grassland)
			set_state(grass)


#BUTTON FUNCTION HERE!!!!!
func _on_Button_pressed():
	$CanvasLayer/Map_Texture.hide()

func _on_Homeland_pressed():
	update_map_scene("homeland")

func _on_Grassland_pressed():
	update_map_scene("grassland")

func _on_Map_pressed():
	$CanvasLayer/Map_Texture.show()
