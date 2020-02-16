extends KinematicBody2D

var pos = Vector2()

func _physics_process(delta):
	pos = Vector2()
	pos.y -= 850
	pos = move_and_slide(pos)
	
func _ready():
	pass 

func _on_Timer_timeout():
	queue_free()
	
