extends VBoxContainer

signal option_selected(option)

func _ready():
	hide()
	
	
func show_options(options):
	
	for button in get_children():
		button.queue_free()
	
	var index = 0
	
	for option in options:
		var button = Button.new()
		button.text = option
		
		button.name = str(index)
		index += 1
		
		button.connect("pressed", self, '_button_pressed', [button.name])
		
		add_child(button)
	show()

func _button_pressed(name):
	emit_signal("option_selected", int(name))
	hide()
