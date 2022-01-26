extends Sprite

signal animation_completed

export var characterName: String

# Se inizia con un _ sono funzioni private e gli altri 
# oggetti non possono chiamarle
func _ready():
	visible = false

func enter():
	visible = true
	$AnimationPlayer.play("Enter")

func leave():
	$AnimationPlayer.play("Leave")

# Funzione che viene chiamata da AnimationPlayer alla fine
# di ogni animazione
func _end():
	emit_signal("animation_completed")
