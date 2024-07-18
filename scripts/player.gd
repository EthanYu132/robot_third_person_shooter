extends CharacterBody2D

var bro = 10
var can_laser: bool = true
var can_grenade: bool = true
@export var max_speed: int = 500
var speed: int = max_speed

signal laser(pos, direction)
signal grenade(pos, direction)
signal update_stats()

func hit():
	Globals.health -= 10
	
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed 
	move_and_slide()
	Globals.player_pos = global_position
	
	
	#rotate player
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("primary action") and can_laser == true and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		#randomly seletect a marker 2d for the laser start:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		var player_direction = (get_global_mouse_position() - position).normalized()
		$laser_timer.start()
		
		laser.emit(selected_laser.global_position, player_direction)
		
		
	if Input.is_action_pressed("secondary action") and can_grenade == true and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		var player_direction = (get_global_mouse_position() - position).normalized()
		$grenade_reload.start()
		grenade.emit(selected_grenade.global_position, player_direction)
		


func _on_timer_timeout():
	can_laser = true # Replace with function body.


func _on_grenade_reload_timeout():
	can_grenade = true
	
func add_item(type: String) -> void:
	update_stats.emit()
	
