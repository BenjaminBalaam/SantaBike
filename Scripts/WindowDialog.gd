extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var background

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("menu"):
		if !is_visible():
			get_tree().paused = true
			background = get_node("../ColorRect")
			popup_centered()
			background.show()
		else:
			get_tree().paused = false
			background = get_node("../ColorRect")
			hide()
			background.hide()
