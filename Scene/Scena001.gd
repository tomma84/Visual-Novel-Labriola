extends Node2D

onready var lisa = $Lisa
onready var sophia = $Sophia
onready var textBox = $TextBox

func _ready():
	
	yield(get_tree().create_timer(1), "timeout")
	
	lisa.enter()
	textBox.fade_in(lisa.characterName)
	yield(textBox, "animation_completed")
	
	textBox.display('Ciao io mi chiamo Lisa e sarò la protagonista di questa storia',lisa.characterName)
	yield(textBox, "next")
	
	textBox.display('In questa visual novel conoscerò tanti amici e amiche', lisa.characterName)
	yield(textBox, "next")
	
	textBox.display('Lisa vieni qui a vedere come sto scrivendo il codice', 'Emanuele')
	yield(textBox, "next")
	
	textBox.display('Eccomi che arrivo', lisa.characterName)
	yield(textBox, "next")
	
	lisa.leave()
	textBox.fade_out()
	
	yield(textBox, "animation_completed")
	
	sophia.enter()
	textBox.fade_in(sophia.characterName)
	
	textBox.display('Lisa dove sei?',sophia.characterName)
	yield(textBox, "next")
	
	textBox.display('Mi avevi detto di incontrarci qui',sophia.characterName)
	yield(textBox, "next")
	
	textBox.display('Eccomi! Eccomi!',lisa.characterName)
	yield(textBox, "next")
	
	lisa.enter()
	textBox.display('Scusami Sophia se ti ho fatto venire fino a qui ma ora devo scappare', lisa.characterName)
	yield(textBox, "next")
	
	get_tree().change_scene("res://Scene/Scena002.tscn")
