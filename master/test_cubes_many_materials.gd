extends Node3D

const ITERATIONS = 8000


func _ready() -> void:
	for i in ITERATIONS:
		var material := StandardMaterial3D.new()
		material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		material.albedo_color = Color(0, i / float(ITERATIONS), 0)
		
		var mesh_instance := MeshInstance3D.new()
		mesh_instance.mesh = BoxMesh.new()
		mesh_instance.position = Vector3(-300 + i / 50 * 4, -200 + i % 100 * 4, 265)
		mesh_instance.rotation = Vector3(TAU / 8, TAU / 8, TAU / 8)
		mesh_instance.set_surface_override_material(0, material)
		add_child(mesh_instance)
