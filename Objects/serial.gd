extends Node

var manager: GdSerialManager

func _ready():
	manager = GdSerialManager.new()
	manager.data_received.connect(_on_data)
	manager.port_disconnected.connect(_on_disconnect)
	
	# Mode 1 = LINE_BUFFERED (espera pelo \n, perfeito para Arduino)
	if manager.open("COM3", 115200, 1):
		print("Ligado a COM3!")


func _process(_delta):
	# Isto dispara os sinais — obrigatório!
	manager.poll_events()

func _on_data(port: String, data: PackedByteArray):
	var msg = data.get_string_from_utf8().strip_edges()
	print("Recebido: ", msg)
	
	if msg == "left":
		_simular_tecla("left")
	if msg == "down":
		_simular_tecla("down")
	if msg == "up":
		_simular_tecla("up")
	if msg == "right":
		_simular_tecla("right")
func _on_disconnect(port: String):
	print("Desligado de ", port)

func _simular_tecla(acao: String):
	var press = InputEventAction.new()
	press.action = acao
	press.pressed = true
	Input.parse_input_event(press)
	
	# Soltar a tecla logo a seguir
	var release = InputEventAction.new()
	release.action = acao
	release.pressed = false
	Input.parse_input_event(release)
