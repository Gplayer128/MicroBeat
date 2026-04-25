extends Control

@onready var label = $Label #nome do nivel
@onready var sprite = $Sprite2D #imagem
@onready var spriteanim1 = $AnimatedSprite2D #seta previous
@onready var spriteanim2 = $AnimatedSprite2D2 #seta next
@onready var background = $background

var elements = ["Portugal", "Brasil", "Angola", "Cabo Verde", "Guiné Equatorial", "Guiné Bissau", "Moçambique", "São Tomé e Príncipe", "Timor Leste"]
var index_current = 0
var images = [preload("res://Art/Flags/flags/flags/4x3/pt.svg"), preload("res://Art/Flags/flags/flags/4x3/br.svg"), preload("res://Art/Flags/flags/flags/4x3/ao.svg"), preload("res://Art/Flags/flags/flags/4x3/cv.svg"), preload("res://Art/Flags/flags/flags/4x3/gq.svg"), preload("res://Art/Flags/flags/flags/4x3/gw.svg"), preload("res://Art/Flags/flags/flags/4x3/mz.svg"), preload("res://Art/Flags/flags/flags/4x3/st.svg"), preload("res://Art/Flags/flags/flags/4x3/tl.svg")]
var bg = [preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/pt-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/br-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/ao-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/cv-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/qg-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/qw-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/mz-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/st-bkg.png"), preload("res://Art/cartoon-20260213T155634Z-1-001/cartoon/tl-bkg.png")]
var bgcurrent = 0
var images_current = 0	
var framecurrent1 = 0
var framecurrent2 = 0
var total_frames1 = [1,2]
var total_frames2 = [1,2]

func _ready():
	update()
	
func _process(delta: float) -> void:
	Menu_Inputs()

func _on_next_pressed():
	index_current = (index_current + 1) % elements.size()
	images_current = (images_current + 1) % images.size()
	
	bgcurrent = (bgcurrent + 1) % bg.size()
	update()
	


func _on_back_pressed():
	index_current = (index_current - 1) % elements.size()
	images_current = (images_current - 1) % images.size()

	bgcurrent = (bgcurrent - 1) % bg.size()
	update()

func update():
	Global.current_level_name = elements[index_current]
	label.text = Global.current_level_name
	sprite.texture = images[images_current]
	spriteanim1.frame = framecurrent1
	spriteanim2.frame = framecurrent2
	background.texture = bg[bgcurrent]
	


func _on_play_pressed():
	Global.current_mode = "freeplay"
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")
	
func _on_play_2_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")

func Menu_Inputs():
	if Input.is_action_just_pressed("down"):
		_on_play_pressed()
	if Input.is_action_just_pressed("up"):
		_on_play_2_pressed()
	if Input.is_action_just_pressed("left"):
		_on_back_pressed()
	if Input.is_action_just_pressed("right"):
		_on_next_pressed()
