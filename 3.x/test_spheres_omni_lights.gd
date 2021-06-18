extends Spatial

# Setting iterations above 420 or so causes system lockup (tested on NVIDIA + Linux).
const ITERATIONS = 200


func _ready() -> void:
	var material := SpatialMaterial.new()
	material.albedo_color = Color(1, 1, 1)

	for i in ITERATIONS:
		var mesh_instance := MeshInstance.new()
		mesh_instance.mesh = SphereMesh.new()
		mesh_instance.translation = Vector3(-50 + i / 20 * 4, -35 + i % 20 * 4, 50)
		mesh_instance.rotation = Vector3(TAU / 8, TAU / 8, TAU / 8)
		mesh_instance.scale = 2.25 * Vector3.ONE
		mesh_instance.set_surface_material(0, material)
		add_child(mesh_instance)

		var omni_light := OmniLight.new()
		omni_light.translation = Vector3(-50 + i / 20 * 4, -33 + i % 20 * 4, 50)
		# Make GLES2 output look closer to GLES3.
		omni_light.light_energy = 0.5 if OS.get_current_video_driver() == OS.VIDEO_DRIVER_GLES2 else 1
		omni_light.omni_range = 15
		omni_light.light_color = Color(1, 0.25, i / float(ITERATIONS))
		add_child(omni_light)
