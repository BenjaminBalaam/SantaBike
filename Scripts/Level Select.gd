extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const button = preload("res://Scenes/Level Button Template.tscn")
var newButton
var text
var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		newButton = button.instance()
		newButton.text = "Level " + str(i+1)
		newButton.level = str(i+1)
		newButton.addedPos.y = i
		self.add_child(newButton)
	for j in range(5):
		newButton = button.instance()
		newButton.text = "Level " + str(j+6)
		newButton.level = str(j+6)
		newButton.addedPos.x = 1
		newButton.addedPos.y = j
		self.add_child(newButton)
	text = $"Label"
	screenSize = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	text.rect_position.x = (screenSize.x - 875) / 2
	text.rect_position.y = screenSize.y * 0.883333333
