extends CharacterBody2D

var moving = false
@export var speed = 3

func get_input():
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite2D.animation = "right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite2D.animation = "left"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$AnimatedSprite2D.animation = "down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimatedSprite2D.animation = "up"
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity

func _physics_process(delta):
	if Global.is_girl_move and !Global.stop_move:
		get_input()
	move_and_slide()
