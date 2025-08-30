shader_type canvas_item;

uniform float boarder_size : hint_range(0.0, 1.0, 0.01);
uniform float warp_intensity = 1.0;
uniform vec2 sprite_scale;
uniform sampler2D noise: repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV * 2.0 - 1.0;
	vec2 res = 1.0 / TEXTURE_PIXEL_SIZE;
	uv.x *= sprite_scale.x / sprite_scale.y;

	vec3 normal = texture(noise, UV).rgb;
	uv -= normal.r * warp_intensity * (vec2(0.0) - uv);

	if (abs(uv.x) > boarder_size * sprite_scale.x || abs(uv.y) > boarder_size * sprite_scale.y) {
		COLOR.rgb = vec3(1.0);
	}
	else {
		COLOR.rgb = vec3(0.0);
	}

	COLOR.a = 1.0;
	if (abs(uv.x) > sprite_scale.x || abs(uv.y) > sprite_scale.y)
		COLOR.a = 0.0;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
