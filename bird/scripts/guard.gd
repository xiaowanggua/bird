extends Node2D

@export var silly = false
@export var speed = 60
@export var fire = 0

func _ready():
	$AnimatedSprite2D.play()
func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "girls":
		Global.is_die = true

func _process(delta):
	if !silly:
		if get_node("../").name == "PathFollow2D":
			get_node("../").progress += speed * delta
			$Area2D/CollisionPolygon2D.disabled = false;
			$Area2D.show()
	else:
		if fire == 1:
			get_node("/root/Rooms/Room4/Node2D4").show()
			get_node("../../../Node2D4/Key/Area2D/CollisionShape2D").disabled = false
			fire = -1
		if fire == -1:
			$AnimatedSprite2D.animation = "no"
			
		no_silly()
		$Area2D/CollisionPolygon2D.disabled = true;
		$Area2D.hide()
		self.rotate(1)
func no_silly():
	await get_tree().create_timer(13).timeout
	silly = false
