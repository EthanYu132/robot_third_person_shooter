extends Node2D
class_name LevelParent
var test_array: Array[String] = ["Test","Hello","Stuff"]

var laser_scene = preload("res://scenes/laser.tscn")
var grenade_scene = preload("res://scenes/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#$icon.rotation_degrees = 90
	#for i in range(len(test_array)):
		#print(test_array[i])
	print($Player/player_image.bro2)
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
	for scout in get_tree().get_nodes_in_group("Scouts"):
		scout.connect("laser", _on_scout_laser)

func _on_scout_laser(pos,direction):
	create_laser(pos,direction)
	
func create_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	
	
func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	#$Items.add_child(item)
	item.direction = direction
	$Items.call_deferred("add_child", item)
		
func _process(delta):
	#$icon.rotation_degrees += 10
	#if $icon.rotation_degrees > 180:
		#$icon.rotation_degrees = 0
	pass
	

#func _on_area_2d_body_entered(body):
	#print("entered")



func _on_player_laser(pos,direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_grenade(pos,direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()

#func _on_house_player_entered():
	#var tween = get_tree().create_tween()
	#tween.set_parallel(true)
	##tween.tween_property($Player, "modulate:a",0,2)
	#tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1)#.set_trans(Tween.TRANS_QUAD)
	##changes the curve of the camera transition (is linear by default)
#
#
#
#
#func _on_house_player_exited():
	#var tween = get_tree().create_tween()
	#tween.set_parallel(true)
	##tween.tween_property($Player, "modulate:a",1,2)
	#tween.tween_property($Player/Camera2D,"zoom",Vector2(0.6,0.6),1)


#func _on_player_update_stats():
	#$UI.update_laser_text()
	#$UI.update_grenade_text()
	#$UI.update_health_text()
