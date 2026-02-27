extends Control

#perfect ffff00
#great 00ff00
#good 00ab00
#ok 00d7ff
#miss ff0000

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffff00"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("00ff00"))
		"GOOD":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("00ab00"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("00d7ff"))
		_:
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ff0000"))
