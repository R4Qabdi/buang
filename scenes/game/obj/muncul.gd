extends AnimatedSprite2D

@onready var mob = preload("res://scenes/game/obj/mob.tscn")
@onready var sampah = preload("res://scenes/game/obj/sampah.tscn")

var jenis = "normal"
func _ready() -> void:
	jenis = global.jenis
	if jenis == "normal":
		play("default")
	elif jenis == "sampah":
		play("sampah")
	elif jenis == "tikus":
		play("tikus")

func _on_animation_finished() -> void:
	if jenis == "normal" :
		var mobins = mob.instantiate()
		mobins.position = position
		get_parent().add_child.call_deferred(mobins)
		queue_free()
		
	elif  jenis == "tikus" :
		var mobins = mob.instantiate()
		mobins.position = position
		get_parent().add_child.call_deferred(mobins)
		queue_free()
		
	elif jenis == "sampah" :
		var mobins = sampah.instantiate()
		mobins.position = position
		get_parent().add_child.call_deferred(mobins)
		queue_free()
		
