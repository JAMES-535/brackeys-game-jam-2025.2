shader_type canvas_item;

uniform float boarder_size : hint_range(0.0, 1.0, 0.01);
uniform float warp_intensity = 1.0;
uniform vec2 sprite_scale;
uniform sampler2D wall_tex: filter_nearest;
uniform sampler2D noise: repeat_enable;
uniform sampler2D stars: repeat_enable, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec3 normal = texture(noise, UV).rgb;
	vec2 uv = UV;
	//uv -= normal.r * warp_intensity * normalize(vec2(0.5) - uv);
	vec4 wall_col = texture(wall_tex, uv);

	if (wall_col == vec4(0.0, 0.0, 0.0, 1.0)) {
		COLOR = texture(stars, SCREEN_UV * 0.5);
	}
	else {
		COLOR = wall_col;
	}

	/*
	vec2 uv = UV * 2.0 - 1.0;
	vec2 res = 1.0 / TEXTURE_PIXEL_SIZE;

	float scale_ratio = sprite_scale.x / sprite_scale.y;
	uv.x *= scale_ratio;

	vec3 normal = texture(noise, UV).rgb;
	uv -= normal.r * warp_intensity * (vec2(0.0) - uv);

	vec2 screen_uv = SCREEN_UV * 0.2;
	vec3 stars_col = texture(stars, screen_uv).rgb;
	COLOR.rgb = stars_col;

	/*if (abs(uv.x) > boarder_size * scale_ratio || abs(uv.y) > boarder_size) {
		COLOR.rgb = vec3(1.0);
	}
	else {
		COLOR.rgb = stars_col;
	}

	COLOR.a = 1.0;
	if (abs(uv.x) > sprite_scale.x || abs(uv.y) > sprite_scale.y)
		COLOR.a = 0.0;
	*/
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
