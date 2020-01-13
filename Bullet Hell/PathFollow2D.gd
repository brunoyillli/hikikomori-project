extends PathFollow2D

onready var objeto = load("res://inimigo_1.tscn")
var counter = 0

func _ready():
	pass



func _physics_process(delta):
	while(counter < 1):
		var objeto1 = objeto.instance()
		add_child(objeto1)
		objeto1.z_index = -2
		counter += 1