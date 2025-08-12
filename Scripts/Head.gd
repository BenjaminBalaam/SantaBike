extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene("res://Scenes/PlaceHolderScene.tscn")


func _on_Head_body_entered(body):
	global.img = get_viewport().get_texture().get_data()
	get_tree().change_scene("res://Scenes/Dead.tscn")
