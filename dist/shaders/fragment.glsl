varying vec2 vTextureCoord;
uniform sampler2D uTexture1;
uniform sampler2D uTexture2;
uniform vec2 uvAspect;
uniform float uTime;
uniform float uProgress;

mat2 rotate(float a) {
	float s = sin(a);
	float c = cos(a);
	return mat2(c, -s, s, c);
}

void main() {
	vec3 map = vec3(vTextureCoord.x,vTextureCoord.y,1.0);
	vec2 uv = (map.xy - 0.5)*uvAspect + 0.5;

	vec2 uvDivided = fract(uv*vec2(32.,1.));

	float progress = fract(uProgress);

	float time = abs(sin(uTime));

	vec2 uvDisplaced1 = uv + rotate(3.1415296/4.)*uvDivided*progress*.1;
	vec2 uvDisplaced2 = uv + rotate(3.1415296/4.)*uvDivided*(1. - progress)*.1;
	vec4 img1 = texture2D(uTexture1, uvDisplaced1);
	vec4 img2 = texture2D(uTexture2, uvDisplaced2);
	gl_FragColor = mix(img1,img2,progress);
}