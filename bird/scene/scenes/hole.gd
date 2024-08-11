extends AnimatedSprite2D
var id = 10
func _process(delta):
	if Global.collect[id] == 1:
		self.animation = "open"
