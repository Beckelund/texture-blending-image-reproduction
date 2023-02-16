function [color] = getpixel(image, x, y)
%GETPIXEL Summary of this function goes here
%   Detailed explanation goes here


width = size(image,1);
height = size(image,2);

%x_index = round(mod(x, width));
%y_index = round(mod(y, height));

x_index = mod(x, width) + 1;
y_index = mod(y, height) + 1;

color(:) = image(x_index, y_index, :);

end

