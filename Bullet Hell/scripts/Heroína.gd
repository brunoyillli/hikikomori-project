extends KinematicBody2D

var pos = Vector2()
onready var bullets = load("res://bullets.tscn")
var tiroespera

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

		

func _physics_process(delta):
	get_input()
	pos = move_and_slide(pos)
	
	
	
func _ready():
	pass 

func _on_Timer_timeout():
	tiroespera = true



func _on_Area2D_body_entered(body):
	if (body.get_name() == "Heroína") == false:
		$Sprite.hide()
		$AnimatedSprite.show()
		$AnimatedSprite.play("exp")


