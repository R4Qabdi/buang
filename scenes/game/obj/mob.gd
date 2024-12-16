extends CharacterBody2D

@export var jenis : String = "normal"
@export var speed : int = 3500
@export var darah : int = 10
@export var damage : int = 10
@export var defense : int = 1
@export var score : int = 100
var ada : bool = true

func sakit(damage):
	darah = darah*defense-damage
	if darah <= 0:
		global.jumlah -= 1
		global.score += score
		
		queue_free()

func give_damage():
	return damage

func _physics_process(delta: float) -> void:
	if get_parent().get_node_or_null("player"):
		var player_pos = $"../player".global_position
		if ada:
			if global_position.distance_to(player_pos) > 500 :
				speed = 15000
			else :
				if jenis == "normal":
					speed = 3500
				elif jenis == "sampah":
					speed = 2000
			velocity = global_position.direction_to(player_pos)*speed*delta
			$anim.play("default")
			move_and_slide()
		var pex = global_position.direction_to(player_pos).x
		var pey = global_position.direction_to(player_pos).y
		
		#ini baru berfungsi agar animasinya menghadap kemana
		#print(global_position.direction_to(player_pos))
		if  pex > 0:
			$anim.play("default")
			$anim.flip_h = false
		elif pex < 0 :
			$anim.play("default")
			$anim.flip_h = true
		if pey != 0:
			$anim.play("default")
		
		if pey == 0 and pex == 0:
			$anim.stop()
