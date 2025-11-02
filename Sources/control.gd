extends Control

@onready var anim = $AnimationPlayer
var is_paused := false

@export var Buttons: Control
@export var PauseMenu: Panel

func toggle_visibility(object):
	var animation_type : String
	if is_paused:
		animation_type = "close_"
	else:
		animation_type = "open_"
	anim.play(animation_type + str(object.name))
	is_paused = !is_paused

func _on_menu_pressed() -> void:
	toggle_visibility(PauseMenu)
	



func _on_menu_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Sources/main_menu.tscn")


func _on_quit_pressed() -> void:
	anim.play("Quit")
	$MenuTimer.start()


func _on_replay_pressed() -> void:
	anim.play("Quit")
	$Replay.start()


func _on_replay_timeout() -> void:
	get_tree().reload_current_scene()
