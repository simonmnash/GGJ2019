

extends KinematicBody2D
signal snozzal
const GRAVITY = 800
const WALK_SPEED = 600
const JUMP_SPEED = -600
var sleep_accumulator = 0
var velocity = Vector2()
func _ready():
	$AnimatedSprite.play("default")

func _physics_process(delta):
	
	$Attack.get_node("CollisionShape2D").disabled = true
	velocity.y += delta * GRAVITY
	if is_on_floor() and velocity.x == 0 and Input.is_action_pressed("sleep"):
		$AnimatedSprite.play("sleep")
		$Z.show()
		sleep_accumulator = sleep_accumulator + delta
		if sleep_accumulator > 1:
			sleep_accumulator = 0
			emit_signal("snozzal")
	else:
		$Z.hide()
		if Input.is_action_pressed("ui_left"):
			velocity.x = -WALK_SPEED
			if is_on_floor():
				$AnimatedSprite.play("walk_left")
			else:
				$AnimatedSprite.play("jump_left")
	
		elif Input.is_action_pressed("ui_right"):
			velocity.x =  WALK_SPEED
			if is_on_floor():
				$AnimatedSprite.play("walk_right")
			else:
				$AnimatedSprite.play("jump_right")
		else:
			velocity.x = 0
			$AnimatedSprite.play("default")
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_SPEED
		$AnimatedSprite.play("jump")
	if Input.is_action_pressed("ui_down"):
		position.y += 1
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite.play("attack")
		$Attack.get_node("CollisionShape2D").disabled = false

	# We don't need to multiply velocity by delta because MoveAndSlide already takes delta time into account.
	
	# The second parameter of move_and_slide is the normal pointing up.
	# In the case of a 2d platformer, in Godot upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))

