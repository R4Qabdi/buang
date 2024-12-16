extends GPUParticles2D

func _ready() -> void:
	if get_node_or_null("sakitan") :
		$sakitan.play()
	#$sakitan.play()
	emitting = true

func _on_finished() -> void:
	queue_free()
