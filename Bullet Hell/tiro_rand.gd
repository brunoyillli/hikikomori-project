extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
var a = 0
var pos = Vector2()
# Called when the node enters the scene tree for the first time.
var selfposx = position.x
var selfposy = position.y

func _process(delta):
	a += 1
	if a == 500:
		queue_free()



func _physics_process(delta): pos = move_and_slide(pos)

func _ready():    
	#set_as_toplevel(true)
	#pass
	pos = Vector2(get_parent().def_x1, get_parent().def_y1)