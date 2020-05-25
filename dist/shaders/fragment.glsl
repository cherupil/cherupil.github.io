uniform float time;
uniform float progress;
uniform sampler2D texture;
uniform vec4 resolution;

varying vec2 vUv;

void main() {

	vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
	vec4 color = texture2D(texture, newUV);

	gl_FragColor = color;
}