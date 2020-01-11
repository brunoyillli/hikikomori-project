extends KinematicBody2D

var tiroespera
onready var bullets = load("res://padrao_fada_1.tscn")

func _ready():
	pass 
	

func _physics_process(delta):
	_bullet_spawn()


func _bullet_spawn():
	if tiroespera == true:
		var bullets1 = bullets.instance()
		add_child(bullets1)
		print("bulets")
		tiroespera = false
		


func _on_Timer_timeout():
	tiroespera = true
