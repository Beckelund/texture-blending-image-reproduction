function [output] = texture_blending_image_reproduction(input_image)

if ~exist('textures', 'var')
    disp("Textures not loaded, loading textures...")
    load("textures\textures.mat");
    disp("done")
end

%Settings
scale = 1/16;

%segment image
image = im2double(input_image);
image = imresize(image, scale, "bicubic");


%Replace each color with texture id
f = waitbar(0,'step 2');
id_map = uint8(zeros(size(image(:,:,1))));
for row = 1:size(image,1)
    for col = 1:size(image,2)

        current_pixel(:) = image(row,col,:);

        id = rgb2textureID(current_pixel, textures);

        id_map(row, col) = id;
    end
    waitbar(row/size(image,1), f,'step 2');
end
close(f)
clear f

id_map = imresize(id_map, 1/scale, "nearest");

% Recreate input image with textures
f = waitbar(0,'step 3');

result = zeros(size(id_map,1), size(id_map,2), 3);
for row = 1:size(id_map,1)
    for col = 1:size(id_map,2)

        result(row,col,:) = getpixel(textures(id_map(row,col)).diffuse, row, col);
    end
    waitbar(row/size(id_map,1), f,'step 3');
end
close(f);
clear f

output = result;
end

