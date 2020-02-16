extends Area2D

var vel = 150
var y = 1
var x = 1	
func _ready():
	randomize()
	pass # Replace with function body.

func _physics_process(delta):
	set_position(get_position() + Vector2(0,1) * vel * delta)

	pass
	
