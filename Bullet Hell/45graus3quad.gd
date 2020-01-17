extends KinematicBody2D

var pos = Vector2()

func _physics_process(delta):
	pos = move_and_slide(pos)
	pos.y += 17.68
	pos.x -= 17.68
	
func _ready():
	pass



