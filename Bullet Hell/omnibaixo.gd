extends KinematicBody2D

var pos = Vector2()

func _physics_process(delta): pos = move_and_slide(pos)

func _ready():    
	#set_as_toplevel(true)
	pos = Vector2(get_parent().get_parent().get_parent().ex, get_parent().get_parent().get_parent().why)