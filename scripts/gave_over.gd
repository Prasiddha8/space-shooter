extends Control

var levelSence : PackedScene = load("res://scenes/level.tscn")
# Called when the node enters the scene tree for the first time.
func ready():
	$CenterContainer/VBoxContainer/Label2.text = "Score"+str(Global.score) 


func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(levelSence)
