extends Node2D

onready var lisa = $Lisa
onready var sophia = $Sophia
onready var dani = $Dani
onready var textBox = $TextBox

func _ready():
	dani.enter()
	sophia.enter()
	lisa.enter()
	
	yield(sophia, "animation_completed")
	
	textBox.fade_in(sophia.characterName)
	yield(textBox, "animation_completed")
	
	textBox.display('Ciao Dani è tanto tempo che non ci vediamo', sophia.characterName)
	yield(textBox, "next")
	
	textBox.display('Davvero in questo periodo ci si vede poco', dani.characterName)
	yield(textBox, "next")
