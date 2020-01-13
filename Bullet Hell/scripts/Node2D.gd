extends Node2D

onready var loadpath1 = load("res://movimento_inimigo_1.tscn")
var chave1


func _ready():
	pass 
	
func _physics_process(delta):

#	Configurações para modo tela cheia e janela

	if OS.is_window_maximized() == false:
		$Camera_windowed.make_current()


	if OS.is_window_maximized():
		$Camera_fulscreen.make_current()
		
	if chave1 == true:
		var loadpath_1 = loadpath1.instance()
		add_child(loadpath_1)
		chave1 = false
		
		
func _on_TimerInimigo_timeout():
	chave1 = true
