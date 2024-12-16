extends Node2D

func _ready() -> void:
	$anim.play("jalan")
	for n in 100 :
		$anim.position.x -= 8 
	$Timer.start()
