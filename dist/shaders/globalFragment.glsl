uniform vec2 resolution;
uniform vec2 mouse;
uniform float speed;
uniform sampler2D tDiffuse;

varying vec2 vUv;

void main() {
	float normSpeed = clamp(speed * 40., 0., 1.);
	float mouseDist = length(vUv - mouse);

	float c = smoothstep(0.2, 0., mouseDist);

	vec2 newUV = vUv;

	float r = texture2D(tDiffuse, (newUV.xy + 0.1*0.5*c*normSpeed)).r;
	float g = texture2D(tDiffuse, (newUV.xy + 0.1*0.3*c*normSpeed)).g;
	float b = texture2D(tDiffuse, (newUV.xy + 0.1*0.1*c*normSpeed)).b;

	gl_FragColor = vec4(r, g, b, 1.0);
}