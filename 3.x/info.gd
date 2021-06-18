extends CanvasLayer

onready var os_label := $ColorRect/VBoxContainer/OS as Label
onready var gpu_label := $ColorRect/VBoxContainer/GPU as Label
onready var backend_label := $ColorRect/VBoxContainer/Backend as Label
onready var resolution_label := $ColorRect/VBoxContainer/Resolution as Label
onready var fps_label := $ColorRect/VBoxContainer/FPS as Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	os_label.text = "OS: %s" % OS.get_name()
	gpu_label.text = "GPU: %s" % VisualServer.get_video_adapter_name()
	backend_label.text = "Graphics API: %s" % OS.get_video_driver_name(OS.get_current_video_driver())
	# warning-ignore:return_value_discarded
	get_viewport().connect("size_changed", self, "_viewport_size_changed")
	_viewport_size_changed()


func _process(_delta: float) -> void:
	fps_label.text = "%d FPS (%.2f mspf)" % [Engine.get_frames_per_second(), 1000.0 / Engine.get_frames_per_second()]


func _viewport_size_changed() -> void:
	resolution_label.text = "Resolution: %dx%d" % [OS.window_size.x, OS.window_size.y]
