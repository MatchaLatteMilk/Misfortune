extends StaticBody2D
signal experience_out(exp_out)
signal attack_focus(damage)

onready var hpbar = $Healthbar

enum{idle,attack,death}
var state setget set_state,get_state

export var mob_level:int
export var health:int
export var damage:int
export var exp_out:int
var focus:int

func set_state(obj):
	state = obj

func get_state():
	return state

func _ready():
	set_state(idle)

func _process(delta):
	match state:
		idle:
			idle_state()
		attack:
			attack_state()
		death:
			death_state()

func update_focus():
	pass

func idle_state():
	print("idle")

func attack_state():
	print("attack")
	emit_signal("attack_focus",damage)

func death_state():
	print("death")
	emit_signal("experience_out",exp_out)

func _on_AttackTimer_timeout():
	set_state(attack)
