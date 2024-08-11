extends ItemList

func adds(id):
	var listok = get_node("/root/Rooms/CanvasLayer/Control/ItemList")
	var list = get_node("/root/Rooms/CanvasLayer/Control/ItemList2")
	if id == 10:
		list.add_item("铲子",listok.get_item_icon(2),false)
	if id == 11:
		list.add_item("迷药",listok.get_item_icon(0),false)
	if id == 0:
		pass
	if id == 1:
		pass
	if id == 2:
		pass
	if id == 3:
		pass
	if id == 4:
		pass
	if id == 5:
		pass
	if id == 12:
		list.add_item("火炬",listok.get_item_icon(0),false)
func remove(id):
	var listok = get_node("/root/Rooms/CanvasLayer/Control/ItemList")
	var list = get_node("/root/Rooms/CanvasLayer/Control/ItemList2")
