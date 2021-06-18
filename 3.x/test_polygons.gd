extends Node2D

const ITERATIONS = 10000
const POINTS = [
	Vector2(0, 0),
	Vector2(0, 64),
	Vector2(64, 64),
	Vector2(40, 0),
]


func _ready() -> void:
	for i in ITERATIONS:
		var polygon := Polygon2D.new()
		polygon.polygon = POINTS
		polygon.position = Vector2(i / 8, i % 620)
		polygon.color = Color(1, 1, i / 10000.0, 0.02)
		add_child(polygon)
