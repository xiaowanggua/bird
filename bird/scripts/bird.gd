extends CharacterBody2D


var movement_speed: float = 200.0
var movement_target_position: Vector2 = Vector2.ZERO
var speed = 4

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	$CollisionShape2D.disabled = true

func actor_setup():

	await get_tree().physics_frame
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(delta):
	$AnimatedSprite2D.play()
	if Global.is_girl_move:
		movement_target_position = get_node("../girls").position - Vector2(16,16)
		call_deferred("actor_setup")
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		var tween = create_tween()
		tween.tween_property(self,"position",next_path_position,0.1)
	else:
		get_input()	
	move_and_slide()

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
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity
