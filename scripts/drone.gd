extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#position = Vector2(300,200)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.RIGHT
	velocity = direction * 100
	move_and_slide()

func hit():
	pass
