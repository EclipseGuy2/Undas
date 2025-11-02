extends StaticBody2D

@onready var anim := $AnimationPlayer
@onready var area := $Area2D

var lit := false
var idle := false
var ghost: CharacterBody2D = null

func _ready() -> void:
	$Start.start()

func _process(_delta: float) -> void:
	if idle:
		anim.play("idle")

	if not idle and ghost and Input.is_action_just_pressed("interact"):
		if area.get_overlapping_bodies().has(ghost):
			lit = true
			idle = true

	if lit:
		lit = false
		idle = true
		if ghost.has_method("lit"):
			ghost.lit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Ghost":
		ghost = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == ghost:
		ghost = null


func _on_start_timeout() -> void:
	anim.play("godim")
	$Start.queue_free()
