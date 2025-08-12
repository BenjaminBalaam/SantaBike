extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var animSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animSprite = $"../AnimatedSprite"
	if global.current_level == 10:
		animSprite.animation = "Helicopter"
		animSprite.scale = Vector2(20, 20)
		animSprite.position = Vector2(585.477, 250)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_Area_body_entered(body):
	if body.name == "Frame":
		global.completed = true
		global.img = get_viewport().get_texture().get_data()
		global.time = $"../../Bike/CanvasLayer/Label".time
		get_tree().change_scene("res://Scenes/Completed.tscn")
