extends Node2D

var knockedover = false

func _on_Area2D_area_entered(area):
	if knockedover == false:
		self.move_local_y(190)
		$AnimatedSprite.play("broken")
		self.z_index = 0
		knockedover = true