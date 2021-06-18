extends Spatial

const ITERATIONS = 8000


func _ready() -> void:
	for i in ITERATIONS:
		var material := SpatialMaterial.new()
		material.flags_unshaded = true
		material.albedo_color = Color(0, i / float(ITERATIONS), 0)

		var mesh_instance := MeshInstance.new()
		mesh_instance.mesh = CubeMesh.new()
		mesh_instance.translation = Vector3(-300 + i / 50 * 4, -200 + i % 100 * 4, 265)
		mesh_instance.rotation = Vector3(TAU / 8, TAU / 8, TAU / 8)
		mesh_instance.material_override = material
		add_child(mesh_instance)
