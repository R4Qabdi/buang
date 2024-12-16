extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	get_tree().paused = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/level1/game.tscn")

func _on_option_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Anip.play("option")
	else:
		$Anip.play_backwards("option")

func _on_credit_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Anip.play("credit")
	else:
		$Anip.play_backwards("credit")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_close_pressed() -> void:
	$Control/option.button_pressed = false

func _on_cx_pressed() -> void:
	$Control/credit.button_pressed = false
#
#func _on_mouse_toggled(toggled_on: bool) -> void:
	#if toggled_on:
		#Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
func _on_mouse_toggled(toggled_on: bool) -> void:
	$mtrail.visible = toggled_on

#audio moga kerja

func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0 , linear_to_db(value))
func _on_mutemaster_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)

func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
func _on_mutesfx_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(1, toggled_on)

func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
func _on_mutemusic_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(2, toggled_on)


func _on_window_item_selected(index: int) -> void:
	match index :
		0:
			get_window().size = Vector2i(1280, 720)
			global.settings["window"] = Vector2i(1280, 720)
		1:
			get_window().size = Vector2i(1366, 768)
			global.settings["window"] = Vector2i(1366, 768)
		2:
			get_window().size = Vector2i(1920, 1080)
			global.settings["window"] = Vector2i(1920, 1080)

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		get_window().mode = Window.MODE_FULLSCREEN
		global.settings["fullscreen"] = true
		$option/Control/optiontab/Graphics/window.disabled=true
	else :
		get_window().mode = Window.MODE_WINDOWED
		global.settings["fullscreen"] = false
		$option/Control/optiontab/Graphics/window.disabled=false

func _on_switch_toggled(toggled_on: bool) -> void:
	if toggled_on :
		global.settings["scrollswitch"] = true
	else : 
		global.settings["scrollswitch"] = false


func _on_musik_finished() -> void:
	$musik.play()
