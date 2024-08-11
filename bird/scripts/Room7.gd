extends TileMap


func _process(delta):
	if Global.collect[8] == 1:
		$Area2D.hide()
		$Area2D/CollisionShape2D.disabled = true


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name=="girls":
		Global.is_die = true
