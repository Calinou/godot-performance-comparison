extends Node3D

# Setting iterations above this value causes the engine to crash on startup.
const ITERATIONS = 200


func _ready() -> void:
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(1, 1, 1)

	for i in ITERATIONS:
		var mesh_instance := MeshInstance3D.new()
		mesh_instance.mesh = SphereMesh.new()
		mesh_instance.position = Vector3(-50 + i / 20 * 4, -35 + i % 20 * 4, 50)
		mesh_instance.rotation = Vector3(TAU / 8, TAU / 8, TAU / 8)
		mesh_instance.scale = 2.25 * Vector3.ONE
		mesh_instance.set_surface_override_material(0, material)
		add_child(mesh_instance)

		var omni_light := OmniLight3D.new()
		omni_light.position = Vector3(-50 + i / 20 * 4, -33 + i % 20 * 4, 50)
		omni_light.omni_range = 15
		omni_light.light_color = Color(1, 0.25, i / float(ITERATIONS))
		add_child(omni_light)
