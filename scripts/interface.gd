extends CanvasLayer

var time := 1
func setHealth(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	for i in range(amount):
		var text_rect = TextureRect.new()
		text_rect.texture = load("res://Space shooter/sprites/heart_scale_003.png")
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timeout() -> void:
	time += 1
	$MarginContainer/Label.text = "SCORE:"+str(time)
	Global.score = time
