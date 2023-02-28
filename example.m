clc
clear

image = im2double(imread("test_images\Mona_Lisa.jpg"));

result = texture_blending_image_reproduction(image);

imshow(result);