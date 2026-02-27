extends Control



@onready var buttons: VBoxContainer = $Buttons
@onready var options: Panel = $options
@onready var buttons2: VBoxContainer = $Buttons2


func _ready() -> void:
	buttons.visible = true
	options.visible = false
	buttons2.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://freeplay_menu.tscn")
	#buttons.visible = false
	#buttons2.visible = true
	#options.visible = false

func _on_settings_pressed() -> void:
	buttons.visible = false
	options.visible = true
	buttons2.visible = false


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()


func _on_return_pressed() -> void:
	pass # Replace with function body.


func _on_h_slider_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_audio_control_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_buttoncampaign_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/campaign.tscn")


func _on_buttonfreeplay_pressed() -> void:
	get_tree().change_scene_to_file("res://freeplay_menu.tscn")


func _on_buttonreturn_pressed() -> void:
	buttons.visible = true
	options.visible = false
	buttons2.visible = false
