function [textureIndex] = rgb2textureID(rgb, textures)
%RGB2TEXTUREID Summary of this function goes here
%   Detailed explanation goes here

% convert input color to LAB
LAB = rgb2lab(rgb);


% find closest matching texture
shortest = -1;
chosen_texture = 0;

for i = 1:numel(textures)
    current_LAB = textures(i).avgLAB;
    if shortest > norm(LAB - current_LAB) || shortest == -1
        chosen_texture = i;
        shortest = norm(LAB - current_LAB);
    end
end

textureIndex = chosen_texture;
end

