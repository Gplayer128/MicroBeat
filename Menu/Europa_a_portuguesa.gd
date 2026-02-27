extends Button


func _on_pressed() -> void:
	Global.current_level_name = "A portuguesa"
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")
