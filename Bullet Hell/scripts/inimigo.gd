extends KinematicBody2D

var tiroespera
onready var bullets = load("res://padrao_fada_1.tscn")
onready var omni1 = load("res://tiro_de_gelo.tscn")
onready var tirorand = load("res://tiro_rand.tscn")
var omniespera
var omniespera2
var ftimer = 0
var vcounter = 20
var ucounter = 0
var vc = 0
var cv = 0
var ex = -1400
var why = 100
var wcounter = 0
var ne = position.y
var be = position.x
var y_dir
var x_dir
var def_y = 0
var def_x = 0
var opcat = 0
var adjcat = 0
var superdefx = 0
var superdefy = 0
var selfposx = position.x
var selfposy = position.y
onready var targetposy = get_node("/root/Node2D/Heroína").position.y
onready var targetposx = get_node("/root/Node2D/Heroína").position.x
var tangente
var def_y1
var def_x1

func _ready():
	print(self.get_path())
	

func _physics_process(delta):
	_get_position()
	_tg()
	_bullet_spawn()
	_counters()
	
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

func _get_position():
	selfposx = position.x
	selfposy = position.y
	targetposy = get_node("/root/Node2D/Heroína").position.y
	targetposx = get_node("/root/Node2D/Heroína").position.x

func _bullet_spawn():
	
	if get_parent().get_parent().get_parent().get_parent().timer_ini1 > 150:
		
		if tiroespera == true:
			var bullets1 = bullets.instance()
			bullets1.z_index = -1
			add_child(bullets1)
			tiroespera = false

		
	if wcounter == 125:
		pass
		#_tiro_rand()

		
#		if vcounter == 20:
#			for i in range (0,6):
#					_omni()
#					_omni2()
#					ex += 400
#
#		if ucounter == 20:
#			ex = -1600
#			for i in range (0,8):
#					_omni()
#					_omni2()
#					ex += 400
#			ex = -1400

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
	
	if wcounter > 250:
		wcounter = 0
	else:
		wcounter += 1
	


#func _omni():
#	var omnibullet1 = omni1.instance()
#	omnibullet1.position = position
#	omnibullet1.position.y +=100
#	omnibullet1.position.x +=500
#	omnibullet1.z_index = -2
#	add_child(omnibullet1)
#	omnibullet1.set_as_toplevel(true)
	
#func _omni2():
#	var omnibullet1 = omni1.instance()
#	omnibullet1.position = position
#	omnibullet1.position.y +=100
#	omnibullet1.position.x -=2500
#	omnibullet1.z_index = -2
#	add_child(omnibullet1)
#	omnibullet1.set_as_toplevel(true)

func _tiro_rand():

	for i in range (0,15):
		var tiro_rand = tirorand.instance()
		tiro_rand.set_position(Vector2(rand_range(-1350, -700), rand_range(200, 700)) )
		var scale = rand_range(0.5, 1.4)
		tiro_rand.scale = Vector2 (scale, scale)
		get_parent().get_parent().get_parent().get_parent().get_parent().add_child(tiro_rand)
	

func _on_Timer_timeout():
	tiroespera = true

func _on_Area2D_body_entered(body):
	if (body.get_name() == "bulets"):
		get_node("/root/Node2D").score += 12
		print("body")
