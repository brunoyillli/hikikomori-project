extends Label


#onready var u = get_parent().score


func _ready():
	pass
	
func _physics_process(delta):
		set_text(str(get_parent().score))