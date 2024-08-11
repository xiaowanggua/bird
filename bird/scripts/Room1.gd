extends TileMap
var in_door_flag = false

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "girls":
		$Area2D/Label.visible = true
		in_door_flag = true

func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "girls":
		$Area2D/Label.visible = false
		in_door_flag = false
func _process(delta):
	if Global.collect[0] == 1:
		Global.locked1 = false
	if in_door_flag:
		if Input.is_action_just_pressed("E"):
			if !Global.locked1:
				Global.RoomGirl = "Room2"
				Global.RoomName = "Room2"
				#sGlobal.times -= 1
				get_node("../girls").position = Vector2.ZERO
				await get_tree().create_timer(0.25).timeout
				var room2 = Global.Room2.instantiate()
				get_node("../").add_child(room2)
				self.queue_free()
			else:
				Global.say("门上锁了！",1)


