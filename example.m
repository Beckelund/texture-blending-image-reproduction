clc

image = im2double(imread("test_images\Mona_Lisa.jpg"));
image = imresize(image, 2.0, 'bicubic');
image = imresize(image, 1/128, 'bicubic');
image = imresize(image, 128, 'nearest');

result = texture_blending_image_reproduction(image,textures);
%imshow(image)
imshow(result);