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
for i = 1:numel(texture_names)
    textures(i) = loadtexturefolder(texture_names(i));
end
clear i texture_names

% Save textures to .mat
save("textures/textures", "textures");

disp("Success, created textures/textures.mat")