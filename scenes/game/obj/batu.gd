extends Node2D

@onready var kenaijo = preload("res://scenes/game/effects/kenaijo.tscn")
@onready var kena = preload("res://scenes/game/effects/kenapa.tscn")

func _physics_process(delta: float) -> void:
	position += Vector2(1000 * delta, 0)

func _on_kena_body_entered(body: Node2D) -> void:
	if body.has_method("sakit"):
		
		body.sakit(8)
		var kenaijoin = kenaijo.instantiate()
		kenaijoin.position = global_position
		get_parent().get_parent().get_parent().add_child(kenaijoin)
		$kenasuara.play()
	var kenain = kena.instantiate()
	kenain.position = global_position
	get_parent().get_parent().get_parent().add_child(kenain)
	$kenasuara.play()
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
