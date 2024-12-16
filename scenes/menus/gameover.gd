extends CanvasLayer


func _ready() -> void:
	$Control/Panel/score.text = str(global.score)
	$kalah.play(0.7)
	

func _on_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/level1/game.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")


func _on_credit_pressed() -> void:
	$anip.play("option")


func _on_cx_pressed() -> void:
	$anip.play_backwards("option")
