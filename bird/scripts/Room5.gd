extends TileMap

var in_talk_area = false

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "girls":
		Global.say("窃听",1.5,true)
		in_talk_area = true
		
func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	in_talk_area = false

func _process(delta):
	if in_talk_area:
		if Input.is_action_just_pressed("E") and Global.stop_move == false:
			start_talk()

func start_talk():
	Global.stop_move = true
	Global.say("看守A:诶那个箱子密码是啥来着，我拿铲子用用",1)
	await get_tree().create_timer(1).timeout
	Global.say("看守B:那个啊，好像是8421..",1)
	Global.stop_move = false
	pass
