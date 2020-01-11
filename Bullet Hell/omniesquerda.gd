extends KinematicBody2D

var pos = Vector2()

func _physics_process(delta):
	pos = move_and_slide(pos)
	pos.x -= 25

func _ready():
	pass

