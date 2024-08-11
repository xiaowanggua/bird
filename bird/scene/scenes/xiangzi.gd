extends Node2D
func _on_up_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird" or body.name == "girls":
		self.position+=check_position(Vector2(0,32))
func _on_right_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird" or body.name == "girls":
		self.position+=check_position(Vector2(-32,0))
func _on_down_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird" or body.name == "girls":
		self.position+=check_position(Vector2(0,-32))
func _on_left_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird" or body.name == "girls":
		self.position+=check_position(Vector2(32,0))
func check_position(Vec2) -> Vector2:

	var x = (self.position+Vec2).x
	var y = (self.position+Vec2).y
	#print(x," ",y)
	if (-32 <= x and x <= 320) and -32 <= y and y <= 320:
		return Vec2
	else:
		return Vector2.ZERO		
	

func _process(delta):
	if Global.collect[18] == 1:
		self.position = Vector2(256,288)
		pass
func _on_area_2d_area_entered(area):
	if area.name == "core":
		Global.xiangziOK = true
		Global.check_final()


