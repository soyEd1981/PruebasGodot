extends Node2D

export (Script) var estadisticas

func _ready():
	cargar_juego()
	print($Jugador.estamina)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		salvar_juego()

func salvar_juego():
	var juego_salvado = estadisticas.new()
	juego_salvado.posicion_jugador = $Jugador.position
	juego_salvado.estamina = $Jugador.estamina
	var directorio = Directory.new()
	if not directorio.dir_exists('user://salvados'):
		directorio.make_dir_recursive('user://salvados')
	ResourceSaver.save('user://salvados/juego_salvado.tres', juego_salvado)

func cargar_juego():
	var directorio = Directory.new()
	if not directorio.file_exists('user://salvados/juego_salvado.tres'):
		return false
	
	var juego_cargado = load('user://salvados/juego_salvado.tres')
	$Jugador.position = juego_cargado.posicion_jugador
	$Jugador.estamina = juego_cargado.estamina


