precision highp float;
uniform float time;
uniform vec2 resolution;
varying vec3 fPosition;
varying vec3 fNormal;

#define COLOR vec3
#define POINT vec3

const POINT light = POINT (6.0, 6.0, 2.0);

const COLOR lightColor = COLOR (1.0, 1.0, 1.0);
const COLOR material = COLOR (1.0, 0.0, 1.0);

const float kd = 0.7;

void main()
{
  float diffuse = max(dot(fNormal, normalize(light - fPosition)), 0.0);
 
  COLOR radiance = (kd * diffuse) * lightColor;

  COLOR color=radiance*material;
  gl_FragColor = vec4(color, 1.0);
}
