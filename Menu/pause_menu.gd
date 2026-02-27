extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true


func _on_main_menu_pressed():
	get_tree().paused = false
	if Global.current_mode == "freeplay":
		get_tree().change_scene_to_file("res://freeplay_menu.tscn")
		
			
	else:
		get_tree().change_scene_to_file("res://campaign_menu.tscn") #VERIFICA SE O NOME TA CERTO SE DER ERRO!!!!!!
