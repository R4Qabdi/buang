extends Line2D
@export var panjang = 16
var kuewe : Array 
func _process(delta: float) -> void:
	var target = get_global_mouse_position() 
	kuewe.push_front(target)
	if kuewe.size() > panjang:
		kuewe.pop_back()
	clear_points()
	for gambar in kuewe : 
		add_point(gambar)
