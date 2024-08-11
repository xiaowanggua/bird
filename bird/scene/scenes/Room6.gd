extends TileMap
var in_flag = false
func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird":
		Global.say("偷窃",1.5,true)
		in_flag = true


func _on_area_2d_2_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird":
		in_flag = true

func _physics_process(delta):
	if in_flag and Input.is_action_just_pressed("E") and Global.collect[7] == 0:
		Global.collect[5] = 1
		Global.play_ding()
	if Global.collect[5] == 1:
		$Path2D/PathFollow2D/guard/PointLight2D.hide()
