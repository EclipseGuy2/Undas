extends Node2D

var candles_lit = 0
var done = false

@onready var anim = $AnimationPlayer

func _ready() -> void:
	anim.play("Start")
	$Timer.start()

func _process(_delta: float) -> void:
	var candles = $Candles.get_child_count()
	candles_lit = $Ghost.litup
	
	if candles_lit >= candles and not done:
		finish()
		done = true
	
	var time = int($Timer.time_left)
	$Ghost/CanvasLayer/Label.text = "TIME LEFT: " + str(time)

func finish():
	anim.play("Finish")
	$Finish.start()

func _on_finish_timeout() -> void:
	get_tree().change_scene_to_file("res://Sources/level_3.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Sources/level_1.tscn")
