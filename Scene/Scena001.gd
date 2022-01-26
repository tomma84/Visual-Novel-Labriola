extends Node2D

func _ready():

	# yield mette in attesa il codice, fino a quando non
	# si riceve un segnale specicificato
	# in questo caso aspetta il segnale TIMEOUT
	yield(get_tree().create_timer(3), "timeout")
	$Lisa.enter()
	
	display("Discorso di lisa", "Lisa")
	
	yield(get_tree().create_timer(3), "timeout")
	$Lisa.leave()

	yield($Lisa, "animation_completed")

	$Sophia.enter()
	yield(get_tree().create_timer(3), "timeout")
	$Sophia.leave()

	
