clc
clear

%Includes
addpath("util")

disp("Attempt to generate new database")
if exist("textures/textures.mat", 'file'), disp("texture database already exists, overwriting..."), end

%Get paths
paths = dir("textures_raw");
paths = rmfield(paths, ["folder" "date" "bytes" "isdir" "datenum"]);    %Get names only

for i = 1:numel(paths)
    current_path = paths(i).name;
    texture_names(i) = string(current_path);
end
clear i paths current_path

%filter unwanted files (e.g. ".zip")
texture_names = texture_names(~contains(texture_names, "."));

%Get only select few maps from texture folders
textures(1) = loadtexturefolder(texture_names(1));
texindex = 2;
for i = 2:numel(texture_names)
    
    tex2add = loadtexturefolder(texture_names(i));

    %only add if under threshold
    should_add = true;
    thresh = 10.0;
    for j = 1:numel(textures)
    current_LAB = textures(j).avgLAB;
        if thresh > norm(tex2add.avgLAB - current_LAB)
            should_add = false;
        end
    end

    %Add if not close to other
    if true == true
        textures(texindex) = tex2add;
        texindex = texindex + 1;
    end
end

clear i texture_names

%Filter similar textures

% Save textures to .mat
save("textures/textures", "textures");

disp("Success, created textures/textures.mat")