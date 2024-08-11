extends Node

const tile_size = 32
var times = 8
var is_girl_move = true
var NextRoomIndex = 0
var is_die = false
var RoomName = "Room1"
var RoomGirl = "Room1"
var stop_move = false
var collect = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var locked1 = true
var has_mayao = 0
var chestlocked = true
var haskill = false
var BarOk = false
var xiangziOK = false
@export var Room1:PackedScene = load("res://scene/scenes/Room1.tscn")
@export var Room2:PackedScene = load("res://scene/scenes/Room2.tscn")
func _ready():
	times = 8
	is_girl_move = true
	NextRoomIndex = 0
	is_die = false
	RoomName = "Room1"
	RoomGirl = "Room1"
	stop_move = false
	collect = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	locked1 = true
	has_mayao = 0
	chestlocked = true
	haskill = false
	BarOk = false
	xiangziOK = false
	#作弊
	#collect[0] = 1#初始大门
	#collect[10] = 1#铲子
	#collect[11] = 1#迷药
	#collect = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
func _process(delta):
	#times = 8
	#print(RoomName,RoomGirl)
	has_mayao = 0
	if times <= 0:
		is_die = true
	if is_die:
		is_die = false
		if haskill == false:
				restart()
				haskill = true
func restart():
	stop_move=true
	await get_tree().create_timer(0.5).timeout
	get_node("/root/Rooms/"+RoomName).queue_free()
	get_node("/root/Rooms/girls/CollisionShape2D").disabled = true
	get_node("/root/Rooms/girls/AnimatedSprite2D").animation = "die"
	get_node("/root/Rooms/AudioStreamPlayer").stop()
	get_node("/root/Rooms/girls/AnimatedSprite2D").play()
	await get_tree().create_timer(1.5).timeout
	get_node("/root/Rooms/CanvasLayer/black").show()
	RoomGirl = "Room1"
	get_node("/root/Rooms/girls").position = Vector2.ZERO
	var room1 = Room1.instantiate()
	get_node("/root/Rooms/").add_child(room1)
	is_die = false
	_ready()
	get_node("/root/Rooms/zhong").play()
	await get_tree().create_timer(3.5).timeout
	get_node("/root/Rooms/CanvasLayer/black").hide()
	get_node("/root/Rooms/AudioStreamPlayer").play()
	get_node("/root/Rooms/girls/CollisionShape2D").disabled = false
func say(text,sec,e=false):
	var talk = get_node("/root/Rooms/CanvasLayer/Panel")
	talk.show()
	talk.get_node("./Label").show()
	if e == true:
		talk.get_node("./e").show()
	else:
		talk.get_node("./e").hide()
	talk.get_node("./Label").text = text
	await get_tree().create_timer(sec).timeout
	talk.hide()
	talk.get_node("./Label").hide()
	talk.get_node("./e").hide()

func play_ding():
	get_node("/root/Rooms/ding").play()
	
func check_final():
	print(BarOk ," ", xiangziOK)
	if BarOk == true and xiangziOK == true:
		collect[21] = 1
		say("城堡大门开始发出隆隆响声",1.5,true)
