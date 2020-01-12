extends KinematicBody2D

var pos = Vector2()

func _physics_process(delta):
	pos = move_and_slide(pos)
	pos.y += 25
	pos.x -= 20

func _ready():
	pass



func _on_Timer_timeout():
	queue_free ( )
