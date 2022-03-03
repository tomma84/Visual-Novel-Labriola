extends Node2D

onready var lisa = $Lisa
onready var sophia = $Sophia
onready var dani = $Dani
onready var textBox = $TextBox
onready var responceBox = $CenterContainer/ResponceBox

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

	textBox.hide()

	responceBox.show_options(
		[
			'Saluta i tuoi amici',
			'Chidigli come stanno',
			'Torna a casa'
		]
	)
	
	var option = yield(responceBox, "option_selected")

	textBox.show()
	
	if option == 0:
		textBox.display('Ciao anche a te', sophia.characterName)
		yield(textBox, "next")
	elif option == 1:
		textBox.display('Io sto bene', dani.characterName)
		yield(textBox, "next")
	elif option == 2:
		textBox.display('Io torno a casa', 'Tu')
		yield(textBox, "next")
		
	textBox.hide()

	responceBox.show_options(
		[
			'Opzione 1',
			'Opzione 2',
			'Opzione 2'
		]
	)
	
	option = yield(responceBox, "option_selected")

	textBox.show()
	
	if option == 0:
		textBox.display('Ciao anche a te', sophia.characterName)
		yield(textBox, "next")
	elif option == 1:
		textBox.display('Io sto bene', dani.characterName)
		yield(textBox, "next")
	elif option == 2:
		textBox.display('Io torno a casa', 'Tu')
		yield(textBox, "next")
