function [result] = loadtexturefolder(folder_name)
%takes a raw texture folder and formats it
% to be stored as a ".mat" file

parent_folder = "textures_raw/";

% Remove "-PNG" tag
file_type = "";
if contains(folder_name, "-PNG")
    file_type = ".png";
    name = erase(folder_name, "-PNG");
else
    file_type = ".jpg";
    name = erase(folder_name, "-JPG");
end

% Full paths
diffuse_name = parent_folder + folder_name + "/" + name + "_Color" + file_type;
displace_name = parent_folder + folder_name + "/" + name + "_Displacement" + file_type;

% Read image files
diffuse = im2double(imread(diffuse_name));
displace = im2double(imread(displace_name));

%diffuse = diffuse .* displace; EXPERIMENTAL

% Create new texture
texture.name = name;
texture.diffuse = diffuse;
texture.displace = displace;

% Mean LAB values (for color matching)
diffuse_lab = meanLAB(diffuse);
texture.avgLAB = diffuse_lab;

result = texture;
end

