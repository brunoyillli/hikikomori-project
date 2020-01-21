extends KinematicBody2D

var pos = Vector2()
onready var bullets = load("res://bullets.tscn")
var tiroespera = true
var lifecount = 6
var bool_morte = false
var arealock = true
var vcounter = 0
var ucounter = 0
var speed = 9
var SPEED_SLOW = 5
var dano = false
func _physics_process(delta):
	get_input()
	pos = move_and_slide(pos)
	_Morte()


func get_input():
	pos = Vector2()

	############ MOVIMENTAÇÃO #############
	
	if Input.is_action_pressed('ui_right'):
		pos.x = 1

	if Input.is_action_pressed('ui_left'):
		pos.x = -1

	if Input.is_action_pressed('ui_down'):
		pos.y = 1

	if Input.is_action_pressed('ui_up'):
		pos.y = -1

	if Input.is_action_pressed('ui_shoot'):
		_bullet_spawn()

	if Input.is_action_pressed("ui_focus"):
		$Sprite2.show()
		position += pos.normalized()*SPEED_SLOW
	else:
		position += pos.normalized()*speed
				
	if Input.is_action_just_released("ui_focus"):
		$Sprite2.hide()

func _bullet_spawn():
	if tiroespera == true:
		var bullets1 = bullets.instance()
		print('ddff')
		bullets1.z_index = -5
		add_child(bullets1)
		tiroespera = false
		$Timer.start()
			
func _change_life():
	if  dano == true:
		if lifecount != 1:
			get_node(str("/root/Node2D/spring", lifecount)).hide()
		else:
			get_node(str("/root/Node2D/spring")).hide()
	dano = false
	
func _Morte():
	if bool_morte == true:
		position = Vector2(-625,500)
		$AnimatedSprite.hide()
		$StilllAnim.show()
		bool_morte = false
		arealock = true

		
		

	
func _ready():
	pass






func _on_Area2D_body_entered(body):
	if (body.get_name() == "Heroína" or body.get_name() == "bulets") == false:
		if arealock == true:
			arealock = false
			$StilllAnim.hide()
			$AnimatedSprite.show()
			$AnimatedSprite.set_frame(0)
			$AnimatedSprite.play("exp")
			dano = true
			if(lifecount >= 1):
				_change_life()
				lifecount -= 1
			get_node("/root/Node2D/TimerMorte").start()
	

func _on_TimerMorte_timeout():
	bool_morte = true


func _on_Timer_timeout():
	tiroespera = true
