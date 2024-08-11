extends Control

@export var game:PackedScene

func _on_button_pressed():
	var newgame = game.instantiate()
	get_node("/root/").add_child(newgame)
	self.queue_free()


func _on_button_2_pressed():
	pass
