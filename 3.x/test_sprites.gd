extends Node2D

const ITERATIONS = 10000


func _ready() -> void:
	for i in ITERATIONS:
		var sprite := Sprite.new()
		sprite.texture = preload("res://icon.png")
		sprite.position = Vector2(i / 8, i % 620)
		sprite.modulate = Color(1, 1, i / 10000.0, 0.02)
		add_child(sprite)
