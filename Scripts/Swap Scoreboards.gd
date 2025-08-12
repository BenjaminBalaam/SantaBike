extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	
	$Top.rect_position.x = screenSize.y / 24
	$Top.rect_position.y = screenSize.y / 24
	$Personalised.rect_position.y = screenSize.y / 24
	$Personalised.rect_position.x = screenSize.x - (screenSize.y / 24) - 254



func _on_Top_pressed():
	$"../Centre/Table Top".show()
	$"../Centre/Table Personalised".hide()


func _on_Personalised_pressed():
	$"../Centre/Table Top".hide()
	$"../Centre/Table Personalised".show()
