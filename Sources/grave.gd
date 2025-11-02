extends StaticBody2D

@export var sprite: int

func _ready() -> void:
	$Sprite2D.frame = sprite
