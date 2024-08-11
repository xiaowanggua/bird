extends TileMap



func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "girls":
		Global.is_die = true
		
func _process(delta):
	if(Global.collect[10]==1):
		$AnimatedSprite2D.animation = "open"


func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	hide_ci()


func _on_area_2d_3_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	hide_ci()

func hide_ci():#-6 -3   5 -2
	$Area2D.hide()
	$Area2D/CollisionShape2D.position += Vector2(9999,1000)
	$Timer.start()



func _on_timer_timeout():
	$Area2D.show()
	$Area2D/CollisionShape2D.position -= Vector2(9999,1000)
