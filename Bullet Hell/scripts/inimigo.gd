extends KinematicBody2D

var tiroespera
onready var bullets = load("res://padrao_fada_1.tscn")
onready var omni1 = load("res://tiro_de_gelo.tscn")
var omniespera
var omniespera2
var ftimer = 0
var vcounter = 20
var ucounter = 0
var vc = 0
var cv = 0
var ex = -1400
var why = 500
func _ready():
	pass 
	

func _physics_process(delta):
	_bullet_spawn()
	_counters()


func _bullet_spawn():
	
	if get_parent().get_parent().get_parent().get_parent().timer_ini1 > 150:
		
		if tiroespera == true:
			var bullets1 = bullets.instance()
			bullets1.z_index = -1
			add_child(bullets1)
			tiroespera = false
		
		
		if vcounter == 20:
			for i in range (0,6):
					_omni()
					ex += 400

		if ucounter == 20:
			ex = -1600
			for i in range (0,8):
					_omni()
					ex += 400
			ex = -1400

func _counters():
	if vcounter < 40:
		vcounter += 1
	else:
		vcounter = 0
	
	if ucounter < 40:
		ucounter += 1
	else:
		ucounter = 0
	
	get_parent().get_parent().get_parent().get_parent().timer_ini1 += 1


func _omni():
	var omnibullet1 = omni1.instance()
	omnibullet1.position = Vector2(0,15)
	omnibullet1.z_index = -2
	$RemoteTransform2D.add_child(omnibullet1)
	
func _on_Timer_timeout():
	tiroespera = true

func _on_Area2D_body_entered(body):
	if (body.get_name() == "bulets"):
		get_node("/root/Node2D").score += 12
		print("body")
