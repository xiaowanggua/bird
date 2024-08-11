extends Area2D


var in_flag = false

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "guard":
		in_flag = true
func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "guard":
		in_flag = false
func _process(delta):
	if in_flag and !Global.BarOk:
		$ProgressBar.value+=0.1
	if Global.BarOk:
		$ProgressBar.value = 100
	if !in_flag and !Global.BarOk:
		if $ProgressBar.value > 0:
			$ProgressBar.value-=0.1
	if $ProgressBar.value >= 99.5 and Global.BarOk == false:
		Global.BarOk = true
		Global.check_final()
