extends TextureRect

signal animation_completed
signal next

onready var nameLabel = $NameBackground/NameLabel
onready var richTextLabel = $RichTextLabel
onready var tween = $Tween
onready var animationPlayer = $AnimationPlayer

var _printing = false # Variabile di stato che specifica se il programma sta stampando un testo sullo schermo
					  # può valore TRUE o FALSE

func _ready():
	hide()
	animationPlayer.play("RESET")
	
	
#	# TEST
#	yield(get_tree().create_timer(4), "timeout")
#
#	fade_in('')
#	yield(self, "animation_completed")
#
#	display("In una bella giornata di Gennaio Emanuele spiega come fare una Visual Novel")

#	yield(self, "next")
#
#	display("Ciao Antonietta come va? Ciao Antonietta come va? Ciao Antonietta come va?", "Emanuele")
#
#	yield(self, "next")
#
#	display("Tutto bene grazie","Antonietta")
#
#	yield(self, "next")
#
#	display("Come è andata a te la giornata?","Antonietta")
#
#	yield(self, "next")
#
#	display("Dovevo vedermi con Luca ma non è stato possibile perchè doveva studiare","Emanuele")
#
#	yield(self, "next")
#
#	display("Mi dispiace che non siete riusciti a vedervi","Antonietta")
#
#	yield(get_tree().create_timer(5), "timeout")
#
#	fade_out()
	


func _unhandled_input(event):
	if Input.is_action_just_pressed("next"):
		if _printing:
			tween.seek(INF) # Sposto l'animazione ad un tempo infinito, quindi è maggiore
							# della durata. L'animazione andrà alla fine.
		else:
			emit_signal("next")

func fade_in(characterName):
	show()
	nameLabel.text = characterName
	richTextLabel.text = ''
	animationPlayer.play("fade_in")

func fade_out():
	animationPlayer.play("fade_out")

func display(text, character_name='Narratore', speed=20.0):
	show()
	nameLabel.text = character_name
	var text_length = text.length()
	richTextLabel.visible_characters = 0
	richTextLabel.text = text
	tween.interpolate_property(richTextLabel, "visible_characters", 0, text_length, text_length/speed)
	tween.start()
	_printing = true

func _end():
	emit_signal("animation_completed")


func _on_Tween_tween_all_completed():
	_printing = false
