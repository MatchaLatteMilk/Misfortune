extends Node2D

enum {left,right}

export var speed = 20
export var facing = left
var velocity = Vector2.ZERO

func _physics_process(delta):
	move(delta)

func move(delta):
	match facing:
		left:
			move_slide(left,delta)
		right:
			move_slide(right,delta)

func move_slide(dir,delta):
	match dir:
		left:
			velocity.x = -speed
			self.translate(velocity * delta)
		right:
			velocity.x = speed
			self.translate(velocity * delta)

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
