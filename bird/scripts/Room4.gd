extends TileMap

var in_flag = false

func _ready():
	$CanvasLayer.hide()
	$CanvasLayer/Panel/SpinBox.editable = false
	$CanvasLayer/Panel/SpinBox2.editable = false
	$CanvasLayer/Panel/SpinBox3.editable = false
	$CanvasLayer/Panel/SpinBox4.editable = false
func _process(delta):
	if Input.is_action_just_pressed("E") and Global.chestlocked and in_flag:
		print(11)
		$CanvasLayer.show()
		$CanvasLayer/Panel/SpinBox.editable = true
		$CanvasLayer/Panel/SpinBox2.editable = true
		$CanvasLayer/Panel/SpinBox3.editable = true
		$CanvasLayer/Panel/SpinBox4.editable = true
	if $CanvasLayer/Panel/SpinBox.value == 8 and $CanvasLayer/Panel/SpinBox2.value == 4 and $CanvasLayer/Panel/SpinBox3.value == 2 and $CanvasLayer/Panel/SpinBox4.value == 1:
		Global.chestlocked = false
		_ready()
		Global.collect[10] = 1
		Global.say("你获得了铲子！",1.5)
	if Global.collect[10]==1:
		$AnimatedSprite2D.animation = "open"
	
func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "bird" and Global.has_mayao == 0:
		Global.say("找到了个迷药，按R可以放置到地上作为陷阱，用好可以再拿",1)
		Global.collect[11] = 1#迷药
		Global.has_mayao == 1
		Items.adds(11)


func _on_area_2d_body_entered(body):
	if body.name == "girls":
		in_flag = true

func _on_esc_button_down():
	_ready()


func _on_area_2d_body_exited(body):
	if body.name == "girls":
		in_flag = false
