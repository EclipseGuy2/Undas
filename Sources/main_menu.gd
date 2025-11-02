extends Control

@onready var anim = $AnimationPlayer

func _on_play_pressed() -> void:
	anim.play("Pressed")
	$Play.start()


func _on_quit_pressed() -> void:
	anim.play("Pressed")
	$Quit.start()

func _process(_delta: float) -> void:
	if anim.is_playing() and anim.current_animation == "Pressed":
		return
	else:
		anim.play("Default")

func _on_play_timeout() -> void:
	get_tree().change_scene_to_file("res://Sources/level_1.tscn")


func _on_quit_timeout() -> void:
	get_tree().quit()
