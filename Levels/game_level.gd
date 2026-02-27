extends Node2D

@onready var sprite1 = $Background
var Bkgt = preload("res://Art/better-call-saul-goodman-3d.webp")

func _ready() -> void:
	var Bkg = Global.level_info.get(Global.current_level_name).get("bkg")
	sprite1.texture = Bkg
