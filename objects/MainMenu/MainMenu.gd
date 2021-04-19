extends Control

onready var Main = preload("res://objects/World/SuperWorld.tscn").instance()
onready var extra = $Extra

var math = 0

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		get_tree().change_scene_to(Main)

func _process(delta):
	extra_type()
	loop_count(delta)

func loop_count(delta):
	extra.self_modulate.a = extra.self_modulate.a + math * delta

func extra_type():
	if extra.self_modulate.a >= 1:
		math = -0.5
	if extra.self_modulate.a <= 0:
		math = 0.5
