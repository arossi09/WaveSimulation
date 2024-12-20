#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

out vec3 Normal;
out vec3 fragPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;


void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0f);
    fragPos = vec3(model * vec4(aPos, 1.0f));
    //calculate the normal matrix and multiply it by the normal
    //to account for non-unfirom scalers



    Normal = mat3(transpose(inverse(model))) * aNormal;
}
