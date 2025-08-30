shader_type canvas_item;

uniform float t: hint_range(0.0, 1.0, 0.01) = 0.0;

void fragment() {
	vec2 uv = UV * 2.0 - 1.0;
	uv = vec2(-uv.x, uv.y);
	float ft = t * 4.0 - 2.0;
	COLOR = vec4(1.0);
	if (uv.x + ft < uv.y)
		COLOR.a = 0.0;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
