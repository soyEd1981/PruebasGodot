extends Node

signal estamina_agotada

func _ready():
	pass

func cansancio(estamina):
	if estamina <= 0:
		emit_signal("estamina_agotada")

