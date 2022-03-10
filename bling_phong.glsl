precision highp float;
uniform float time;
uniform vec2 resolution;
varying vec3 fPosition;
varying vec3 fNormal;

#define COLOR vec3
#define POINT vec3

const POINT camera = POINT(0.0, 0.0, 0.0);
const POINT light = POINT (6.0, 6.0, 2.0);

const COLOR lightColor = COLOR (1.0, 1.0, 1.0);
const COLOR material = COLOR (1.0, 0.0, 1.0);

const float ka=0.08;
const float kd = 0.7;
const float ks = 1.0 - kd;
const float shininess = 32.;

void main()
{
  float diffuse = max(dot(fNormal, normalize(light - fPosition)), 0.0);
  float specular = pow(max(dot(normalize(normalize(camera-fPosition)+normalize(light-fPosition)), fNormal), 0.0), shininess * 2.0);
  COLOR radiance = (ks*specular+kd * diffuse + ka) * lightColor;

  COLOR color=radiance*material;
  gl_FragColor = vec4(color, 1.0);
}
