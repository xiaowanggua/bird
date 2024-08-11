extends Sprite2D
@export var huoba = 0
@export var keyid = 0
@export var zimu = ""
func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body.name == "bird" or body.name == "girls") and Global.collect[keyid] == 0:
		Global.collect[keyid] = 1 #key
		Global.play_ding()
		if zimu != "":
			Global.say("拿到"+zimu+"钥匙",1.5)
		#if huoba == 1:
		#	Items.adds(12)
		self.hide()
func _process(delta):
	if Global.collect[keyid] == 1:
		self.hide()
	if huoba == 1 and Global.collect[keyid] == 1:
		get_node("../").hide()
