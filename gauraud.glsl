// Vertex Shader

precision highp float;
attribute vec3 position;
attribute vec3 normal;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
varying vec3 fNormal;
varying vec3 fPosition;
varying vec4 finalColor;

#define COLOR vec3
#define POINT vec3

const POINT camera = POINT(0.0, 0.0, 0.0);
const POINT light = POINT (6.0, 6.0, 2.0);

const COLOR lightColor = COLOR (1.0, 1.0, 1.0);
const COLOR material = COLOR (1.0, 0.0, 1.0);

const float ka = 0.08;
const float kd = 0.7;
const float ks = 1.0 - kd;
const float shininess = 32.;

void main()
{
  fNormal = normalize(normalMatrix * normal);
  vec4 pos = modelViewMatrix * vec4(position, 1.0);
  fPosition = pos.xyz;
  gl_Position = projectionMatrix * pos;
  
    float diffuse = max(dot(fNormal, normalize(light - fPosition)), 0.0);
  float specular = pow(max(dot(normalize(reflect(fPosition - light, fNormal)), normalize(camera - fPosition)), 0.0), shininess);
 
  COLOR radiance = (ks * specular + kd * diffuse + ka) * lightColor;
 
  COLOR color = radiance * material;
  finalColor=vec4(color,1.0);
}

// Fragment Shader

precision highp float;
uniform float time;
uniform vec2 resolution;
varying vec3 fNormal;
varying vec3 fPosition;
varying vec4 finalColor;

void main()
{
  gl_FragColor = finalColor;
}
