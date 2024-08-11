extends Node2D

func _process(delta):
	if Global.times > 0:
		for i in range(Global.times,9):
			get_node("Sprite2D"+str(i)).hide()
		for i in range(1,Global.times+1):
			get_node("Sprite2D"+str(i)).show()
	elif Global.times <=0:
		for i in range(1,9):
			get_node("Sprite2D"+str(i)).hide()
