extends LevelParent


func _on_gate_player_entered_gate():
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,0.5)
	#get_tree().change_scene_to_file("res://scenes/inside.tscn")
	TransitionLayer.change_scene("res://scenes/inside.tscn")



func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	#tween.tween_property($Player, "modulate:a",0,2)
	tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1)#.set_trans(Tween.TRANS_QUAD)
	#changes the curve of the camera transition (is linear by default)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	#tween.tween_property($Player, "modulate:a",1,2)
	tween.tween_property($Player/Camera2D,"zoom",Vector2(0.6,0.6),1)
