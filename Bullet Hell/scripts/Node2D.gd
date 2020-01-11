extends Node2D



func _ready():
	pass 
	
func _physics_process(delta):

#	Configurações para modo tela cheia e janela

	if OS.is_window_maximized() == false:
		$Camera_windowed.make_current()
		print('weed')

	if OS.is_window_maximized():
		$Camera_fulscreen.make_current()
		print('weed')