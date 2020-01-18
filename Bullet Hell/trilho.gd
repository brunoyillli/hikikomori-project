extends Path2D

onready var follow = get_node('trilhoo')
#onready var objeto = load("res://inimigo_1.tscn")
#var counter = 0
func _ready():
	set_process(true)

func _process(delta):
	follow.set_offset(follow.get_offset() + 250 * delta) 

#func _physics_process(delta):
	#while(counter < 1):
		#var objeto1 = objeto.instance()
		#add_child(objeto1)
		#counter += 1