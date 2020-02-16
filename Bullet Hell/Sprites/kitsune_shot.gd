extends Area2D

const vel = 120
const dir = Vector2(0.4,4)

func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	translate(dir * vel * delta)
	
	pass


