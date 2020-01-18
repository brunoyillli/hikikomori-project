extends KinematicBody2D

var pos = Vector2()

func _physics_process(delta):
	pos = Vector2()
	get_input()
	pos = move_and_slide(pos)
	print(position)

func get_input():
	if Input.is_action_pressed('ui_right'):
		pos.x += 230

	if Input.is_action_pressed('ui_left'):
		pos.x -= 230

	if Input.is_action_pressed('ui_down'):
		pos.y += 230

	if Input.is_action_pressed('ui_up'):
		pos.y -= 230

func _ready():
	print(self.get_path())

func _on_Timer_timeout():
	queue_free()