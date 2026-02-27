extends Control

@onready var anmp = $AnimationPlayer

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		anmp.stop()
		get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	
