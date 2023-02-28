function [result] = meanLAB(input)
% Calculates the mean LAB value from an RGB image
% or a RGB color

if isequal(size(input), [1,3])
    LAB = rgb2lab(input);   % only a single color input
else
    % input is an image
    lab_image = rgb2lab(input);
    LAB(1) = mean(mean(lab_image(:,:,1)));
    LAB(2) = mean(mean(lab_image(:,:,2)));
    LAB(3) = mean(mean(lab_image(:,:,3)));
end

result = LAB;
end

