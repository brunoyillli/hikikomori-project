extends KinematicBody2D

var pos = Vector2()
var selfposx = position.x
var selfposy = position.y
onready var targetposy = get_node("/root/Node2D/Heroína").position.y
onready var targetposx = get_node("/root/Node2D/Heroína").position.x
onready var omni1 = load("res://test.tscn")
onready var omni2 = load("res://tiro_direcional.tscn")
var directional_bullet
var vcounter = 15
var timer_ini_1 = 0
var ex = -200
var why = -200
var vc = 0
var cv = 0
var direction 
var y_dir
var x_dir
var def_y = 0
var def_x = 0
var tangente
var ecounter = 0
var def_x1 = 0 
var def_y1 = 0
var superdefx = 0
var superdefy = 0
var opcat = 0
var adjcat = 0

func _ready():
	pass

func _physics_process(delta):
	_bullet_spawn()
	_mover()
	_counters()
	_get_position()
	_tg()
	_directional_bullet()



func _bullet_spawn():
	
	if timer_ini_1 > 300:
		if vcounter == 0:
			if(vc == 0 ):
				why = 282
				ex = 0
				vc += 1
				_omni()

			if(vc == 1 ):
				ex = 282
				why = 0
				vc += 1
				_omni()

			if(vc == 2 ):
				ex = -282
				why = 0
				vc += 1
				_omni()

			if(vc == 3 ):
				why = -282
				ex = 0
				vc += 1
				_omni()

			if(vc == 4 ):
				why = -199.5
				ex = -199.5
				vc += 1
				_omni()
				
			if(vc == 5 ):
				why = 199.5
				ex = -199.5
				vc += 1
				_omni()
				
			if(vc == 6 ):
				why = -199.5
				ex = 199.5
				vc += 1
				_omni()

			if(vc == 7 ):
				why = 199.5
				ex = 199.5
				vc += 1
				_omni()

			if(vc == 8 ):
				why = 108
				ex = 261
				vc += 1
				_omni()

			if(vc == 9):
				ex = 108
				why = 261
				vc += 1
				_omni()

			if(vc == 10 ):
				why = -108
				ex = 261
				vc += 1
				_omni()

			if(vc == 11 ):
				ex = -108
				why = 261
				vc += 1
				_omni()
				
			if(vc == 12 ):
				why = +108
				ex = -261
				vc += 1
				_omni()

			if(vc == 13):
				why = -108
				ex = -261
				vc += 1
				_omni()
				
			if(vc == 14 ):
				why = -108
				ex = +261
				vc += 1
				_omni()
				
			if(vc == 15 ):
				why = -261
				ex = +108
				vc += 1
				_omni()
				
			if(vc == 16 ):
				why = -261
				ex = -108
				vc += 1
				_omni()
				
			vc = 0; cv = 0; ex = 0; why = 0
				

func _mover():
	if timer_ini_1 < 120:
		pos = Vector2()	
		pos.y += 120
		pos = move_and_slide(pos)

	
func _omni():
	var omnibullet1 = omni1.instance()
	omnibullet1.position = Vector2(0,15)
	omnibullet1.z_index = -2
	add_child(omnibullet1)


func _directional_bullet():
	if ecounter == 60:
		var directional_bullet = omni2.instance()
		directional_bullet.position = Vector2(0,15)
		directional_bullet.z_index = -2
		add_child(directional_bullet)


func _get_position():
	selfposx = position.x
	selfposy = position.y
	targetposy = get_node("/root/Node2D/Heroína").position.y
	targetposx = get_node("/root/Node2D/Heroína").position.x
	
func _tg():

	if selfposx > targetposx:
		def_x = (selfposx - targetposx)

	elif targetposx > selfposx:
		def_x = (targetposx - selfposx)

	if selfposy > targetposy:
		def_y = (selfposy - targetposy)

	elif targetposy > selfposy:
		def_y = (targetposy - selfposy)


	tangente = def_x/def_y
	superdefx = rad2deg(sin(atan(tangente)))*25
	superdefy = rad2deg(cos(atan(tangente)))*25
	
	
	if (selfposx < targetposx) and (selfposy < targetposy):
		def_x1 = superdefx; def_y1 = superdefy
		
	elif (selfposx > targetposx) and (selfposy > targetposy):
		def_x1 = -superdefx; def_y1 = -superdefy

	elif (selfposx > targetposx) and (selfposy < targetposy):
		def_x1 = -superdefx; def_y1 = superdefy

	elif (selfposx < targetposx) and (selfposy > targetposy):
		def_x1 = superdefx; def_y1 = -superdefy

func _counters():
	if vcounter < 30:
		vcounter += 1
	else:
		vcounter = 0
	
		
	if ecounter < 60:
		ecounter += 1
	else:
		ecounter = 0
	
	timer_ini_1 += 1

func _on_Area2D_body_entered(body):
	if (body.get_name() == "bulets"):
		get_node("/root/Node2D").score += 12
		print("body")
