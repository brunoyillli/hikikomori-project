extends Node2D

onready var loadpath1 = load("res://movimento_inimigo_1.tscn")
onready var loadpath2 = load("res://movimento_inimigo_2.tscn")
var chave1 = 0
var chave2 = 0
var score= 0
var timer_ini1 = 0


func _ready():
	pass
	
func _physics_process(delta):

#	Configurações para modo tela cheia e janela

	if OS.is_window_maximized() == false:
		$Camera_windowed.make_current()
	
	

	if OS.is_window_maximized():
		$Camera_fulscreen.make_current()
		
	if chave1 == 200:
		var loadpath_1 = loadpath1.instance()
		add_child(loadpath_1)
		
		
	if chave1 == 1400:
		var loadpath_2 = loadpath2.instance()
		add_child(loadpath_2)
	
	chave1 += 1
	chave2 += 1

