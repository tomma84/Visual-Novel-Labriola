extends TextureRect

signal animation_completed

onready var nameLabel = $NameBackground/NameLabel
onready var richTextLabel = $RichTextLabel
onready var tween = $Tween
onready var animationPlayer = $AnimationPlayer

func _ready():
	hide()
	animationPlayer.play("RESET")
	
	# TEST
	show()
	
	# yield(get_tree().create_timer(4), "timeout")

	display("Ciao io sono un testo di prova", "Emanuele")

	yield(get_tree().create_timer(5), "timeout")
	
	fade_out()
	
	
func fade_in():
	show()
	animationPlayer.play("fade_in")

func fade_out():
	animationPlayer.play("fade_out")

func display(text, character_name, speed = 20.0):
	show()
	nameLabel.text = character_name
	var text_length = text.length()
	richTextLabel.visible_characters = 0
	richTextLabel.text = text
	tween.interpolate_property(richTextLabel, "visible_characters", 0, text_length, text_length/speed)
	tween.start()

func _end():
	emit_signal("animation_completed")
