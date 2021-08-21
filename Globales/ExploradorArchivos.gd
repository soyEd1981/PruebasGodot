extends Node

func _ready():
	pass

func obtener_archivos(carpeta):
	var archivos_recolectados = {}
	var conteo_archivos = 0
	var directorio = Directory.new()
	
	directorio.open(carpeta)
	directorio.list_dir_begin()
	
	while true:
		var archivo = directorio.get_next()
		if archivo == "":
			break
		elif not archivo.begins_with(".") and not archivo.ends_with('import'):
			archivos_recolectados[conteo_archivos] = carpeta + archivo
			conteo_archivos += 1
	var lista_archivos: Array = []
	for a in archivos_recolectados.values():
		lista_archivos.append(load(a))
	
	return lista_archivos
	#return archivos_recolectados
