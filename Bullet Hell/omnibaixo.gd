extends KinematicBody2D

var pos = Vector2()
var rot = 0
var mcounter = 0
onready var dork = get_parent().get_parent().dork

func _physics_process(delta): 
	pos = move_and_slide(pos)
	rotation_degrees = rot
	rot += 2
	if mcounter > 800:
		queue_free()
	mcounter += 1
	
func _ready():    
	#set_as_toplevel(true)
	if dork == true:
		$Sprite2.show()
		$Sprite.hide()
		pos = Vector2(-1*(get_parent().get_parent().ex), get_parent().get_parent().why)
	else:
		pos = Vector2((get_parent().get_parent().ex), get_parent().get_parent().why)