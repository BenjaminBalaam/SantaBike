extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	if !OS.has_feature('JavaScript'):
		disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_KeyBoard_pressed():
	if OS.has_feature('JavaScript'):
		$"../LineEdit".text = JavaScript.eval("var name = prompt('Enter your name','');name;")
	else:
		print("This option is only available on the web.")
