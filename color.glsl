precision highp float;
uniform float time;
uniform vec2 resolution;
varying vec3 fPosition;
varying vec3 fNormal;

#define COLOR vec3
#define POINT vec3

const COLOR lightColor = COLOR (1.0, 1.0, 1.0);
const COLOR material = COLOR (1.0, 0.0, 1.0);


void main()
{
  COLOR color=lightColor*material;
  gl_FragColor = vec4(color, 1.0);
}