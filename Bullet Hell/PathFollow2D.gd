extends PathFollow2D

onready var objeto = load("res://inimigo_1.tscn")

func _ready():
	var objeto1 = objeto.instance()
	add_child(objeto1)
	objeto1.z_index = -2

