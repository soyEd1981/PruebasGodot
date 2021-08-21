extends Node2D

# ¡¡¡Ésta es la buena!!!!

var IMAGENES: Dictionary = {
	'cuerpo': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/_Characters/Human/"),
	'cabello': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/Head/Hairstyles/")}

var cuerpo_actual: int = 0
var cabello_actual: int = 0

func _ready():
	$Cuerpo.texture = IMAGENES['cuerpo'][cuerpo_actual]
	$Cabello.texture = IMAGENES['cabello'][cabello_actual]
	
func _on_SeleccionCabello_pressed():
	cabello_actual = (cabello_actual + 1) % IMAGENES['cabello'].size()
	$Cabello.texture = IMAGENES['cabello'][cabello_actual]

func _on_SeleccionCuerpo_pressed():
	cuerpo_actual = (cuerpo_actual + 1) % IMAGENES['cuerpo'].size()
	$Cuerpo.texture = IMAGENES['cuerpo'][cuerpo_actual]



