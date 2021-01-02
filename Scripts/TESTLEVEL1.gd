extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var wheel
var dead
var screenSize

const DEAD = preload("res://Scenes/Dead.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	wheel = $"Bike/Wheel1"
	screenSize = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Head_dead():
	global.img = get_viewport().get_texture().get_data()
	get_tree().change_scene("res://Dead.tscn")
