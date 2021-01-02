extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var restarted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KillBox_body_exited(body):
	if body.name == "Frame":
		if global.current_level != 0:
			if global.completed == false:
				global.img = get_viewport().get_texture().get_data()
				get_tree().change_scene("res://Scenes/Dead.tscn")
