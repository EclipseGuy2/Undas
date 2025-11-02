extends CharacterBody2D

@export var speed := 400

@onready var anim = $AnimationPlayer
@onready var sprite = $Sprite2D

var lighting = false
var litup = 0
var start = true

func _ready() -> void:
	anim.play("start")
	$start.start()

func _physics_process(_delta):
	var input_vector := Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	velocity = input_vector * speed
	
	if Input.is_action_just_pressed("interact"):
		$Lighting.start()
		lighting = true
	
	move_and_slide()

func _process(_delta: float) -> void:
	$CanvasLayer2/Label.text = "CANDLES LIT-UP: " + str(litup)
	if start:
		return
	else:
		if velocity.x != 0:
			anim.play("Walk")
			
		if lighting:
			anim.play("Interact")
		
		else:
			anim.play("Idle")
		
		var direction := Input.get_axis("right", "left")
		
		if direction != 0:
			sprite.flip_h = direction < 0
	

func lit():
	litup += 1


func _on_start_timeout() -> void:
	start = false


func _on_lighting_timeout() -> void:
	lighting = false
