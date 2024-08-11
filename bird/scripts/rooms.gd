extends Node2D

@export var girl:PackedScene
@export var bird:PackedScene
@export var mayao:PackedScene
@onready var Audioplayer = $AudioStreamPlayer

func _ready():
	var girls = girl.instantiate()
	girls.position = Vector2(16,16)
	var birds = bird.instantiate()
	add_child(girls)
	add_child(birds)
	Audioplayer.play()
	


func _process(delta):
	if Global.RoomGirl == Global.RoomName:
		$girls.show()
		get_node("./girls/CollisionShape2D").disabled = false
		if Input.is_action_just_pressed("Q"):
			Global.is_girl_move = !Global.is_girl_move
	else:
		$girls.hide()
		get_node("./girls/CollisionShape2D").disabled = true
	if Global.is_girl_move:
		if Input.is_action_just_pressed("R") and Global.collect[11] == 1:
			Global.collect[11] = 0
			var my = mayao.instantiate()
			get_node("./"+Global.RoomName).add_child(my)
			my.position = $girls.position
		$Camera2D.position = get_node("./girls").position
		get_node("./bird/CollisionShape2D").disabled = true
		#get_node("./girls/CollisionShape2D").disabled = false
	else:
		if Input.is_action_just_pressed("R") and Global.collect[11] == 1:
			Global.collect[11] = 0
			var my = mayao.instantiate()
			get_node("./"+Global.RoomName).add_child(my)
			my.position = $bird.position
		$Camera2D.position = get_node("./bird").position
		get_node("./bird/CollisionShape2D").disabled = false
		#get_node("./girls/CollisionShape2D").disabled = true
