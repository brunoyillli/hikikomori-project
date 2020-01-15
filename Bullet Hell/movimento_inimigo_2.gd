extends Node2D

var timer_ini1 = 0

func _ready():
	pass 

func _on_Timer_timeout():
	queue_free()
