extends Node

var udp: PacketPeerUDP

func _ready():
	udp = PacketPeerUDP.new()
	var err = udp.bind(4242, "0.0.0.0")
	if err != OK:
		print("ERRO ao fazer bind! Código: ", err)
	else:
		print("UDP a escutar na porta 4242 ✅")

func _process(_delta):
	var count = udp.get_available_packet_count()
	if count > 0:
		print("Pacotes disponíveis: ", count)
		var packet = udp.get_packet()
		var msg = packet.get_string_from_utf8().strip_edges()
		print("Recebido: ", msg)
		
		if msg in ["left", "down", "up", "right"]:
			_simular_tecla(msg)
	else:
		# Descomenta a linha abaixo para ver se o _process está a correr
		# print("Nenhum pacote...")
		pass

func _simular_tecla(acao: String):
	var press = InputEventAction.new()
	press.action = acao
	press.pressed = true
	Input.parse_input_event(press)
	
	var release = InputEventAction.new()
	release.action = acao
	release.pressed = false
	Input.parse_input_event(release)

func _exit_tree():
	udp.close()
