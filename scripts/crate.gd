extends ItemContainer

func hit():
	if not opened:
		$LidSprite.hide()
		#spawn many 
		
		for i in range(5):
			var pos = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()).global_position
			open.emit(pos,current_direction)
		get_tree().get_nodes_in_group("Container")
		
	opened = true
