 extends Node2D

onready var loadpath1 = load("res://movimento_inimigo_1.tscn")
onready var loadpath2 = load("res://movimento_inimigo_2.tscn")
var chave1 = 0
var chave2 = 0
var score= 0
var timer_ini1 = 0

func _physics_process(delta):
	if OS.is_window_maximized():
		$Camera_fulscreen.make_current()
		

	if chave1 == 200:
		var loadpath_1 = loadpath1.instance()
		add_child(loadpath_1)
		chave1 = false
		
		
	if chave2 == 1600:
		var loadpath_2 = loadpath2.instance()
		add_child(loadpath_2)
	
	chave1 += 1
	chave2 += 1

