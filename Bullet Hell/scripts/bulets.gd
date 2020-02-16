extends Area2D

var vel = 150
var dir = Vector2(0,-1)

func _physics_process(delta):
	translate(dir * vel * delta)
	
func _ready():
	add_to_group("tiro_basico")
	pass 

func _on_Timer_timeout():
	queue_free()
	
func _on_ship_shot_area_enter(area):
	if area.has_method("destroy"):
		area.destroy(self)
		
func destroy():
	queue_free()