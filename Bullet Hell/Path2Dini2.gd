extends Path2D
onready var follow = get_node('PathFollow2D')

func _ready():
	pass 

func _process(delta):
	follow.set_offset(follow.get_offset() - 250 * delta) 