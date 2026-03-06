extends Control

@onready var label = $Label #nome do nivel
@onready var sprite = $Sprite2D #imagem
@onready var spriteanim1 = $AnimatedSprite2D #seta previous
@onready var spriteanim2 = $AnimatedSprite2D2 #seta next


var elements = ["Portugal", "Brasil", "Angola", "Cabo verde", "Guine Equatorial", "Guine Bissau", "Mocambique", "Sao tome e principe", "Timor leste"]
var index_current = 0
var images = [preload("res://Art/Flags/flags/flags/4x3/pt.svg"), preload("res://Art/Flags/flags/flags/4x3/br.svg"), preload("res://Art/Flags/flags/flags/4x3/ao.svg"), preload("res://Art/Flags/flags/flags/4x3/cv.svg"), preload("res://Art/Flags/flags/flags/4x3/gq.svg"), preload("res://Art/Flags/flags/flags/4x3/gw.svg"), preload("res://Art/Flags/flags/flags/4x3/mz.svg"), preload("res://Art/Flags/flags/flags/4x3/st.svg"), preload("res://Art/Flags/flags/flags/4x3/tl.svg")]
var images_current = 0	
var framecurrent1 = 0
var framecurrent2 = 0
var total_frames1 = [1,2]
var total_frames2 = [1,2]

func _ready():
	update()
	



func _on_next_pressed():
	index_current = (index_current + 1) % elements.size()
	images_current = (images_current + 1) % images.size()
	framecurrent2 = (framecurrent2 + 1) % total_frames2.size()
	update()
	


func _on_back_pressed():
	index_current = (index_current - 1) % elements.size()
	images_current = (images_current - 1) % images.size()
	framecurrent1 = (framecurrent1 + 1) % total_frames1.size()
	update()

func update():
	Global.current_level_name = elements[index_current]
	label.text = Global.current_level_name
	sprite.texture = images[images_current]
	spriteanim1.frame = framecurrent1
	spriteanim2.frame = framecurrent2


func _on_play_pressed():
	Global.current_mode = "freeplay"
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")
	



	
	

	
