extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var position = self.get_parent().find_node("Cat").position[0]
	if position > 0:
		self.rect_position=Vector2(position, 0)
	else:
		self.rect_position=Vector2(0, 0)