extends Area2D
var speed = 350



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position.y -= speed*delta
