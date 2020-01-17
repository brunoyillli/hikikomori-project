extends KinematicBody2D

onready var omni1 = load("res://test.tscn")
var vcounter = 15
var timer_ini_1 = 0
var ex = -200
var why = -200
var vc = 0
var cv = 0

func _ready():
	for i in range(1, 10):
		print(i)
	

func _physics_process(delta):
	_bullet_spawn()
	_counters()


func _bullet_spawn():
	
	if timer_ini_1 > 100:
		if vcounter == 15:
			while(vc < 2):
				_omni()
				while(cv < 1):
					ex += 400; why += 400
					cv += 1
				vc += 1
					
			while(vc >= 2 and vc < 4 ):
				why -= 200
				_omni()
				vc += 1
					
			while(vc >= 4 and vc < 6 ):
				while(cv < 2):
					ex = -200
					why = 200
					cv += 1
				_omni()
				why -= 200
				vc += 1
					
			while(vc >= 6 and vc < 8 ):
				while(cv < 3):
					ex = 0
					why = -200
					cv += 1
				_omni()
				why += 400
				vc += 1
				
			vc = 0; cv = 0; ex = -200; why = -200
				



func _omni():
	var omnibullet1 = omni1.instance()
	omnibullet1.position = Vector2(0,15)
	omnibullet1.z_index = -2
	add_child(omnibullet1)

	
	
func _counters():
	if vcounter < 30:
		vcounter += 1
	else:
		vcounter = 0
	
	timer_ini_1 += 1


func _on_Area2D_body_entered(body):
	if (body.get_name() == "bulets"):
		get_node("/root/Node2D").score += 12
		print("body")
