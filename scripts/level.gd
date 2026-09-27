extends Node2D

var meteorScene: PackedScene = load("res://scenes/meteor.tscn")
var laserScene: PackedScene = load("res://scenes/laser.tscn")
var health = 5

func _on_meteor_timer_timeout():
	var meteor = meteorScene.instantiate()
	$Meteors.add_child(meteor)
	#connect the signal
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	health -= 1
	get_tree().call_group('CanvasLayer','setHealth',health)
	if health <=0:
		get_tree().call_deferred(
	"change_scene_to_file",
	"res://scenes/gave_over.tscn"
)
func _on_player_laser(pos) :
	var laser = laserScene.instantiate()
	$Laser.add_child(laser)
	laser.position = pos
