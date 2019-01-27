

extends KinematicBody2D


var walk_speed = 400
var direction = "left"

var velocity = Vector2()

func _physics_process(delta):
	velocity.x = -walk_speed
	move_and_slide(velocity, Vector2(0, -1))



func _on_Area2D_body_entered(body):
	walk_speed *= -1
	if direction=="left":
		direction="right"
		$AnimatedSprite.play("walk_right")
	else:
		direction = "left"
		$AnimatedSprite.play("walk_left")

func _on_Hitbox_area_entered(area):
	print("dog hit")
