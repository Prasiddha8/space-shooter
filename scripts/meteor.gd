extends Area2D

var speed
var rotationSpeed
var directionX : float 
signal collision
func _ready():
#meteor positioning
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -10)
	position = Vector2(random_x, random_y)

#speed
	speed= rng.randi_range(200,500)
	directionX = rng.randi_range(-1,1)
	rotationSpeed = rng.randi_range(50,100)
	
#meteor randomness
	var rock_numbers = [1, 2, 5, 6, 7]
	var path: String = "res://Space shooter/sprites/meteros/Rock" + str(rock_numbers.pick_random()) + "_" + str(rng.randi_range(1, 2)) + "_no_shadow.png"	
	$Sprite2D.texture = load(path)
	var s := rng.randf_range(1.0, 2.5)
	$Sprite2D.scale = Vector2(s, s)

func _process(delta: float) -> void:
	position += Vector2(directionX,1.0)*500*delta
	rotation_degrees += rotationSpeed * delta 

func _on_body_entered(body: Node2D):
	collision.emit()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
