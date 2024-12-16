extends Node2D

@export var panjang = 16
var kuewe :Array

func _process(delta: float) -> void:
	if get_node_or_null("batu"):
		var target = $batu.position
		kuewe.push_front(target)
		if kuewe.size() > panjang:
			kuewe.pop_back()
		$btrail.clear_points()
		for gambar in kuewe : 
			$btrail.add_point(gambar)
	else : 
		queue_free()
