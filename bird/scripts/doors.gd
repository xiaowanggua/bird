extends Area2D

var in_door_flag = false
@export var who = "girls" #girls or bird
@export var to_room = ""
@export var positions = Vector2.ZERO
@export var keyid = -1
@export var needkeyid = -1
@export var warmtext = "门上锁了"
@export var fire = 0
@export var reduce = 1
func _on_body_shape_entered(boasdy_rid, body, body_shape_index, local_shape_index):
	if body.name == who:
		in_door_flag = true


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == who:
		in_door_flag = false
		
func _process(delta):
	if fire == 1:
		$AnimatedSprite2D2.show()
	if in_door_flag:
		if Input.is_action_just_pressed("E"):
			if needkeyid == -1 or Global.collect[needkeyid] == 1:
				#if fire == 1:
				#	$AnimatedSprite2D2.animation = "fire"
				if who != "bird":
					Global.RoomGirl = to_room
					get_node("/root/Rooms/girls").position = positions
					Global.times-=reduce
				else:
					if keyid != -1:
						if Global.collect[keyid] == 0:
							Global.collect[keyid] = 1
							Global.play_ding()
					get_node("/root/Rooms/bird").position = positions
			#await get_tree().create_timer(0.15).timeout
				var rooms = load("res://scene/scenes/"+to_room+".tscn")
				get_node("/root/Rooms").add_child(rooms.instantiate())
				Global.RoomName = to_room
				get_node("../").queue_free()
			else:
				Global.say(warmtext,1)

	



