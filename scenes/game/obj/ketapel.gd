extends Node2D

var bisanembak :bool = true

@onready var batu = preload("res://scenes/game/obj/projbatu.tscn")
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("attack") and bisanembak:
		$tembak.stop()
		$tembak.play()
		#print("tembakkk")
		var batuins = batu.instantiate()
		batuins.position = $mask.position
		batuins.rotation = $mask.global_rotation
		get_parent().get_parent().add_child(batuins)
		
		bisanembak = false
		$cd.start()

func _on_cd_timeout() -> void:
	bisanembak = true
	
