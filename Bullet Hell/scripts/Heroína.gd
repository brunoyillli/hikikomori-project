extends KinematicBody2D

var pos = Vector2()
onready var bullets = load("res://bullets.tscn")
var tiroespera
var lifecount = 6
var bool_morte = false
var arealock = true

func get_input():
	pos = Vector2()

	############ MOVIMENTAÇÃO #############
	
	if Input.is_action_pressed('ui_right'):
		pos.x += 230

	if Input.is_action_pressed('ui_left'):
		pos.x -= 230

	if Input.is_action_pressed('ui_down'):
		pos.y += 230

	if Input.is_action_pressed('ui_up'):
		pos.y -= 230

	if Input.is_action_pressed('ui_shoot'):
		_bullet_spawn()

	if Input.is_action_pressed("ui_focus"):
        $Sprite2.show()

	if Input.is_action_just_released("ui_focus"):
		$Sprite2.hide()
		
	
	

func _bullet_spawn():
	if tiroespera == true:
		var bullets1 = bullets.instance()
		print('ddff')
		add_child(bullets1)
		tiroespera = false

func _Vidas():
	
	if lifecount == 5:
		get_node("/root/Node2D/spring6").hide()
	if lifecount == 4:
		get_node("/root/Node2D/spring5").hide()
	if lifecount == 3:
		get_node("/root/Node2D/spring4").hide()
	if lifecount == 2:
		get_node("/root/Node2D/spring3").hide()
	if lifecount == 1:
		get_node("/root/Node2D/spring2").hide()
	if lifecount == 0:
		get_node("/root/Node2D/spring").hide()

func _Morte():
	if bool_morte == true:
		position = Vector2(-625,500)
		$AnimatedSprite.hide()
		#$AnimatedSprite.set_frame(0)
		$Sprite.show()
		bool_morte = false
		arealock = true
		print('gordo')
		
		
func _physics_process(delta):
	get_input()
	pos = move_and_slide(pos)
	_Morte()
	_Vidas()
	
func _ready():
	pass 

func _on_Timer_timeout():
	tiroespera = true



func _on_Area2D_body_entered(body):
	if (body.get_name() == "Heroína") == false:
		if arealock == true:
			arealock = false
			$Sprite.hide()
			$AnimatedSprite.show()
			$AnimatedSprite.play("exp")
			lifecount -= 1
			get_node("/root/Node2D/TimerMorte").start()



func _on_TimerMorte_timeout():
	bool_morte = true
