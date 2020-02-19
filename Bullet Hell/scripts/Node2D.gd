extends Node2D

onready var loadpath1 = load("res://movimento_inimigo_1.tscn")
onready var loadpath2 = load("res://movimento_inimigo_2.tscn")
onready var loadpath3 = load("res://ini3.tscn")
onready var loadpath4 = load("res://kitsune_spawner.tscn")
onready var omni1 = load("res://tiro_de_gelo.tscn")
var chave1 = 0
var score= 0
var timer_ini1 = 0
var vcounter = 20
var ucounter = 0
var ex = -700
var why = 120
var dork = false
var tiroespera
onready var bullets = load("res://padrao_fada_1.tscn")
onready var tirorand = load("res://tiro_rand.tscn")
var omniespera
var omniespera2
var ftimer = 0
var vc = 0
var cv = 0
var wcounter = 0
var ne = position.y
var be = position.x
var y_dir
var x_dir
var def_y = 0
var def_x = 0
var opcat = 0
var adjcat = 0
var superdefx
var superdefy
var selfposx 
var selfposy 
onready var targetposy = get_node("/root/Node2D/Heroína").global_position.y
onready var targetposx = get_node("/root/Node2D/Heroína").global_position.x
var tangente
var def_y1
var def_x1
var kmcounter = 0

#dollyguaranaa
func _ready():
	pass
	
func _physics_process(delta):
	#_get_position()
	#_tg()
	if kmcounter == 125:
		_tiro_rand()
	#print(rad2deg(atan(rad2deg(0.5))))
	#print(atan(deg2rad(0.5)))
#	Configurações para modo tela cheia e janela
	if OS.is_window_maximized() == false:
		$Camera_windowed.make_current()
	
	

	if OS.is_window_maximized():
		$Camera_fulscreen.make_current()
	_counters()
	if chave1 < 3000:
		
		_bullet_spawn()
	if chave1 == -5:
		var loadpath_4 = loadpath4.instance()
		add_child(loadpath_4)
		#loadpath_4.position.x = -15000
		#loadpath_4.position.y = 90

	if chave1 == 200:
		var loadpath_1 = loadpath1.instance()
		add_child(loadpath_1)
		loadpath_1.position.x = 1075
		loadpath_1.position.y = 90
		
	if chave1 == 1600:
		var loadpath_2 = loadpath2.instance()
		add_child(loadpath_2)
		loadpath_2.position.x = -120
		loadpath_2.position.y = -250
		
	if chave1 == 3000:
		var loadpath_3 = loadpath3.instance()
		

		add_child(loadpath_3)
		loadpath_3.position.x = -620
		loadpath_3.position.y = -50

	chave1 += 1



func _omni():
	var omnibullet1 = omni1.instance()
	omnibullet1.position.y = -370
	omnibullet1.position.x =500
	omnibullet1.z_index = -2
	add_child(omnibullet1)
	
func _omni2():
	var omnibullet1 = omni1.instance()
	omnibullet1.position.y =-370
	omnibullet1.position.x =-1800
	omnibullet1.z_index = -2
	dork = true
	add_child(omnibullet1)
	dork = false
	
func _bullet_spawn():
	
		
		
		
		if vcounter == 20:
			for i in range (0,6):
					_omni()
					_omni2()
					ex += 200

		if ucounter == 20:
			ex = -800
			for i in range (0,8):
					_omni()
					_omni2()
					ex += 200
			ex = -700

func _counters():
	if vcounter < 40:
		vcounter += 1
	else:
		vcounter = 0
	
	if ucounter < 40:
		ucounter += 1
	else:
		ucounter = 0
	
	if kmcounter < 250:
		kmcounter += 1
	else:
		kmcounter = 0 
func _tiro_rand():

	for i in range (0,15):
		var tiro_rand = tirorand.instance()
		var scale = rand_range(0.5, 1.4)
		tiro_rand.scale = Vector2 (scale, scale)
		tiro_rand.set_position(Vector2(rand_range(-1000, -350), rand_range(-200, 300)) )
		selfposx = tiro_rand.position.x
		selfposy = tiro_rand.position.y	
		_get_position()
		_tg()
		
		add_child(tiro_rand)


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
	superdefx = rad2deg(sin(atan(tangente)))*4
	superdefy = rad2deg(cos(atan(tangente)))*4
	
	
	if (selfposx < targetposx) and (selfposy < targetposy):
		def_x1 = superdefx; def_y1 = superdefy
		
	elif (selfposx > targetposx) and (selfposy > targetposy):
		def_x1 = -superdefx; def_y1 = -superdefy

	elif (selfposx > targetposx) and (selfposy < targetposy):
		def_x1 = -superdefx; def_y1 = superdefy

	elif (selfposx < targetposx) and (selfposy > targetposy):
		def_x1 = superdefx; def_y1 = -superdefy

func _get_position():
	targetposy = get_node("/root/Node2D/Heroína").position.y
	targetposx = get_node("/root/Node2D/Heroína").position.x
	