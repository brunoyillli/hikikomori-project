extends Node2D

onready var loadpath1 = load("res://movimento_inimigo_1.tscn")
onready var loadpath2 = load("res://movimento_inimigo_2.tscn")
onready var loadpath3 = load("res://inimigo_3.tscn")
var chave1 = 0
var score= 0
var timer_ini1 = 0

#dollyguarana
func _ready():
	pass
	
func _physics_process(delta):
	#print(rad2deg(atan(rad2deg(0.5))))
	#print(atan(deg2rad(0.5)))
#	Configurações para modo tela cheia e janela
	if OS.is_window_maximized() == false:
		$Camera_windowed.make_current()
	
	

	if OS.is_window_maximized():
		$Camera_fulscreen.make_current()
		
	if chave1 == 200:
		var loadpath_1 = loadpath1.instance()
		add_child(loadpath_1)
		
		
	if chave1 == 1600:
		var loadpath_2 = loadpath2.instance()
		add_child(loadpath_2)
		
		
	if chave1 == 3000:
		var loadpath_3 = loadpath3.instance()

		add_child(loadpath_3)
		loadpath_3.position.x = -1150
		loadpath_3.position.y = -340

	chave1 += 1



