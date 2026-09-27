extends CharacterBody2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var speed = 500
signal laser(pos)
var shootCooldown = .5
var shootTimer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process (delta):
	var direction = Input.get_vector("left", "right", "forward", "backward")
	velocity = direction * speed 
	move_and_slide()
	
	#shooting
	shootTimer -= delta

	if Input.is_action_just_pressed("shoot") and shootTimer <= 0:
		audio_stream_player_2d.play()
		laser.emit(position-Vector2(0,100))
		shootTimer = shootCooldown
		
