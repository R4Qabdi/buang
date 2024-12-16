extends CharacterBody2D
class_name player

@export var panjang_trail : int 
@export var darah : int = 100
var speed = 5000
var mati : bool
var queue : Array
var hurtable : bool = true

var jalan :bool = true

func _ready() -> void:
	global.pdarah = darah

func _physics_process(delta: float) -> void:
	var tatap = get_local_mouse_position()
	$slot.rotation= tatap.angle()
	if $slot/ketapel.global_position > position:
		$slot/ketapel/mask.flip_v = false
	else:
		$slot/ketapel/mask.flip_v = true
	
	if Input.is_action_pressed("lari"):
		speed = 8000
		if get_parent().get_node_or_null("trail"):
			trail()
	else : 
		speed = 5000
		if Input.is_action_just_released("lari"):
			if get_parent().get_node_or_null("trail"):
				queue.clear()
				$"../trail".clear_points()
			if get_parent().get_node_or_null("habis"):
				#$"../habis".emitting = false
				$"../habis".emitting = true
				$"../habis".position = position
	
	var direction := Input.get_vector("kiri", "kanan","atas","bawah")
	velocity = direction * speed * delta
	move_and_slide()
	
	var pex = direction.x
	var pey = direction.y
	
	#ini baru berfungsi agar animasinya menghadap kemana
	if  pex > 0:
		$anim.play("jalan")
		$anim.flip_h = false
	elif pex < 0 :
		$anim.play("jalan")
		$anim.flip_h = true
	if pey != 0:
		$anim.play("jalan")
	 
	#ini berfungsi biar animasinya berhenti
	if pey == 0 and pex == 0:
		$anim.stop()
	elif jalan:
		
		$suarajalan.pitch_scale = randf_range(1.2,1.5)
		#print($suarajalan.pitch_scale)
		$suarajalan.play()
		jalan = false
		$suarajalan/cdjalan.start()
	
	
	if $sakit.has_overlapping_bodies():
		if hurtable :
			var jumlahdmg = 0
			print($sakit.get_overlapping_bodies().size())
			for n in $sakit.get_overlapping_bodies().size():
				jumlahdmg += $sakit.get_overlapping_bodies()[n].give_damage()
			darah -= jumlahdmg
			global.pdarah = darah
			hurtable = false
			$iframe.start()

func trail():
	var target = position
	queue.push_front(target)
	if queue.size() > panjang_trail:
		queue.pop_back()
	$"../trail".clear_points()
	for point in queue:
		$"../trail".add_point(point)

func _on_iframe_timeout() -> void:
	hurtable = true



func _on_sakit_body_entered(body: Node2D) -> void:
	pass
	#return body.give_damage()


func _on_cdjalan_timeout() -> void:
	jalan = true
