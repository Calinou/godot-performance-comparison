extends Node3D

const ITERATIONS = 2000


func _ready() -> void:
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(1, 1, 0.2)

	for i in ITERATIONS:
		var mesh_instance := MeshInstance3D.new()
		mesh_instance.mesh = SphereMesh.new()
		mesh_instance.position = Vector3(-110 + i / 35 * 4, -65 + i % 35 * 4, 100)
		mesh_instance.rotation = Vector3(TAU / 8, TAU / 8, TAU / 8)
		mesh_instance.scale = 2.25 * Vector3.ONE
		mesh_instance.set_surface_override_material(0, material)
		add_child(mesh_instance)
