extends KinematicBody2D

export (int) var velocidad

var objetivo = Vector2()
var direccion = Vector2()

var estamina = 1000

func _ready():
	GlobalSenales.connect("estamina_agotada", self, '_on_estamina_agotada')
	set_physics_process(false)

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		set_physics_process(true)
		objetivo = get_global_mouse_position()
		
func _physics_process(_delta):
	direccion = position.direction_to(objetivo) * velocidad
	if position.distance_to(objetivo) > 5:
		GlobalSenales.cansancio(estamina)
		direccion = move_and_slide(direccion)
		estamina -= 1

func _on_estamina_agotada():
	set_process_input(false)


