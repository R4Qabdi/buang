extends Node2D

@onready var mob = preload("res://scenes/game/obj/spawner.tscn")
@onready var mati = preload("res://scenes/menus/gameover.tscn")
@onready var menang = preload("res://scenes/menus/victory.tscn")


func _ready() -> void:
	global.score = 0
	global.jumlah = 0
	get_tree().paused = false
	

func _physics_process(delta: float) -> void:
	$victory/bar.value = $victory/cdmenang.time_left
	if global.pdarah <= 0 :
		var matiins = mati.instantiate()
		get_tree().paused = true
		add_child(matiins)
	$ui/portrait/darah.value = global.pdarah

func _on_mobspawn_timeout() -> void:
	if global.jumlah < 25:
		global.jumlah += 1
		var pilih = randi_range(0,1)
		match pilih :
			0:
				global.jenis = "normal"
			1:
				global.jenis = "sampah"
		$ysort/player/mobpath/mobspos.progress_ratio = randf()
		var mobins = mob.instantiate()
		mobins.position = $ysort/player/mobpath/mobspos.global_position
		get_node("ysort").add_child(mobins)
	#mobin


func _on_musik_finished() -> void:
	$musik.play()


func _on_area_body_entered(body: Node2D) -> void:
	$victory/cdmenang.start()
	$victory/bar.visible = true
	

func _on_area_body_exited(body: Node2D) -> void:
	$victory/cdmenang.stop()
	$victory/bar.value = 0

func _on_cdmenang_timeout() -> void:
	get_tree().paused = true
	var menangins = menang.instantiate()
	add_child(menangins)
	
