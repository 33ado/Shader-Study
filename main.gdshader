shader_type canvas_item;

uniform float animation_speed = 0.5;
uniform float y_offset = 1.0;
uniform sampler2D noise_texture : repeat_enable;
uniform vec4 flame_color : source_color;

void fragment() {
	vec2 uv = vec2(UV.x, UV.y + TIME * animation_speed);
	vec4 noise_color = texture(noise_texture, uv);
	noise_color.rgb += UV.y - y_offset + flame_color.rgb;
	noise_color.rgb = vec3(1.0) - step(noise_color.rgb, vec3(0.5));
	noise_color.a = noise_color.r;
	COLOR = noise_color;
}
