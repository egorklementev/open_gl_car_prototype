#version 330 core
out vec4 FragColor;

struct Material {
    sampler2D texture_diffuse1;
    float shininess;
};

struct Light {
	vec3 direction;
    vec3 ambient;
    vec3 diffuse;
};

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoords;

uniform vec3 viewPos;
uniform Material material;
uniform Light light;

float near = 0.1;
float far  = 100.0;

float LinearizeDepth(float depth);

void main()
{
    vec3 ambient = light.ambient * texture(material.texture_diffuse1, TexCoords).rgb;

    // diffuse
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(-light.direction);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = light.diffuse * diff * texture(material.texture_diffuse1, TexCoords).rgb;

    vec4 texColor = texture(material.texture_diffuse1, TexCoords);
    vec3 result = ambient + diffuse;
    FragColor = vec4(result, texColor.a);
}
