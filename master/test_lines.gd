extends Node2D

const ITERATIONS = 8000
const POINTS = [
	Vector2(34, 83),
	Vector2(60, 26),
	Vector2(66, 71),
	Vector2(44, 77),
]


func _ready() -> void:
	for i in ITERATIONS:
		var line := Line2D.new()
		line.points = POINTS
		line.width = 90
		line.position = Vector2(i / 7, i % 500)
		line.joint_mode = Line2D.LINE_JOINT_ROUND
		line.begin_cap_mode = Line2D.LINE_CAP_ROUND
		line.end_cap_mode = Line2D.LINE_CAP_ROUND
		line.default_color = Color(i / float(ITERATIONS), 1, 1, 0.01)
		add_child(line)
