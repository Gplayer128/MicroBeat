extends Node2D

@onready var asp = $MusicPlayer




#set this constant before game start
const in_edit_mode: bool = false


#time it takes to falling key to reach critical spot
var fk_fall_time: float = 2.2
var fk_output_arr = [[],[],[],[]]


func _ready():
	
	$MusicPlayer.stream = Global.level_info.get(Global.current_level_name).get("music")
	$MusicPlayer.play()
	
	if in_edit_mode:
		Signals.KeyListenerPress.connect(KeyListenerPress)
	else:
		var fk_times = Global.level_info.get(Global.current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		print(fk_times_arr[0])
		
		var counter: int = 0
		
		for key in fk_times_arr:
			
			var button_name: String
			match counter:
				0:
					button_name = "left"
				1:
					button_name = "down"
				2:
					button_name = "up"
				3:
					button_name = "right"
			
			for delay in key:
				SpawnFallingKey(button_name, delay)
				#print (delay)
			
			counter += 1

func KeyListenerPress(button_name: String, array_num: int):
	#print(str(array_num) + " " + str($MusicPlayer.get_playback_position()))
	fk_output_arr[array_num].append($MusicPlayer.get_playback_position() - fk_fall_time)
	

func SpawnFallingKey(button_name: String, delay: float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)


func _on_music_player_finished() -> void:
	if in_edit_mode:
		print(fk_output_arr)
	else:
		pass
