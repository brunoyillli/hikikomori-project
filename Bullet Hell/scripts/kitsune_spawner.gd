extends Node
onready var pre_kitsune = preload("res://Kitsune_menor.tscn")
var interval =2
func _ready():
	set_process(true)
	pass # Replace with function body.


func _process(delta):
	
	if interval > 0:
		interval -= delta
	else:
		interval = rand_range(0.3,1)
		var kitsune = pre_kitsune.instance()
		kitsune.set_position(Vector2(rand_range(30, 610),-40))
		get_owner().add_child(kitsune)
	pass
	