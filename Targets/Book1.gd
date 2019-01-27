extends Node2D

var knockedover = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Area2D_area_entered(area):
	if knockedover == false:
		self.move_local_y(380)
		$AnimatedSprite.play("broken")
		self.z_index = 0
		knockedover = true
