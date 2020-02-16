extends Area2D

var vel = 150
export(int, "A", "B", "C") var tipo = 0
var score = 0
var atributos =[
	{
		texture = preload("res://Sprites/kitsune_medio.png"),
		score = 10
	},
	{
		texture = preload("res://Sprites/kitsune_menor.png"),
		score = 30
	},
	{
		texture = preload("res://Sprites/kitsune_baixo.png"),
		score = 50
	}
]


func _ready():
	var atributo = atributos[tipo]
	get_node("Sprite").set_texture(atributo.texture)
	score = atributo.score
	
	pass 

func _physics_process(delta):
	set_position(get_position() + Vector2(0,1) * vel * delta)

	pass
	
