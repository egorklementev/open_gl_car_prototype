#ifndef MODEL_H
#define MODEL_H

#include <string>
#include <vector>
#include <iostream>

#include <assimp\Importer.hpp>
#include <assimp\scene.h>
#include <assimp\postprocess.h>

#include "stb_image.h"

#include "shader_m.h"
#include "mesh.h"

class Model
{
public:
	/* Functions */
	Model(char * path)
	{
		loadModel(path);
	}
	void Draw(Shader shader);
private:
	/* Model data */
	std::vector<Mesh> meshes;
	std::vector<Texture> textures_loaded;
	std::string directory;
	/* Functions */
	void loadModel(std::string path);
	void processNode(aiNode * node, const aiScene * scene);
	Mesh processMesh(aiMesh * mesh, const aiScene * scene);
	std::vector<Texture> loadMaterialTextures(aiMaterial * mat, aiTextureType, std::string typeName);
};

#endif // !MODEL_H
