extends Control


func _on_north_america_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/americalevelselect.tscn")


func _on_europe_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/europelevelselect.tscn")


func _on_asia_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/asialevelselect.tscn")


func _on_south_america_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/southamericalevelselect.tscn")


func _on_africa_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/africalevelselect.tscn")


func _on_oceania_pressed() -> void:
		get_tree().change_scene_to_file("res://Menu/oceanialevelselect.tscn")
