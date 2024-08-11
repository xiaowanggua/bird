extends TileMap


var in_door1_flag
func _process(delta):
	if Global.collect[0] == 1:
		$Key.hide()
