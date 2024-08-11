extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Rooms/CanvasLayer").hide()
	get_node("/root/Rooms/AudioStreamPlayer").stop()	
	$CanvasLayer/VideoStreamPlayer.play()
