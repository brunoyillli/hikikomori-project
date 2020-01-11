extends KinematicBody2D

var tiroespera
onready var bullets = load("res://padrao_fada_1.tscn")
onready var omni1 = load("res://padraoomnidirecional2.tscn")
onready var omni2 = load("res://padraoomnidirecional.tscn")
var omniespera
var omniespera2
var ftimer = 0

func _ready():
	pass 
	

func _physics_process(delta):
	_bullet_spawn()
	
	while(ftimer < 1):
		$Timer2.start()
		ftimer += 1


func _bullet_spawn():
	if tiroespera == true:
		var bullets1 = bullets.instance()
		bullets1.z_index = -1
		add_child(bullets1)
		tiroespera = false
		
	if omniespera == true:
		var omnibullet1 = omni1.instance()
		omnibullet1.position = Vector2(-475,-230)
		omnibullet1.z_index = -2
		add_child(omnibullet1)
		omniespera = false
		$Timer3.start()

	if omniespera2 == true:
		var omnibullet2 = omni2.instance()
		omnibullet2.position = Vector2(0,0)
		omnibullet2.z_index = -3
		add_child(omnibullet2)
		omniespera2 = false
		$Timer2.start()

func _on_Timer_timeout():
	tiroespera = true


func _on_Timer2_timeout():
	omniespera = true
	


func _on_Timer3_timeout():
	omniespera2 = true
