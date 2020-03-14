%Lab2
% Christos Trimas
% Aggelos Kartakis
% Kostantinos Pantelis

clc;
clear all;
clear;

A = imread('badContrast.bmp');
figure;
imshow(A);
title('Image');         %read image and show it 

A_new = rgb2gray(A);        %grayscaling

figure;
imshow(A_new);
title('Grayscaled image');  %show gray scaled image

figure;
imhist(A_new);                  %show histogram
title('Histogram');

balancedA = histeq(A_new);      %balance the image

figure;
imshow(balancedA);      %show new image
title('Balanced');

figure;
imhist(balancedA);
title('New Histogram');     %show the new histogram


threshold = 148;
[a,b] = size(A_new);
new_A = zeros(a,b);

for i=1:a
    for j=1:b
        if A_new(i,j) < threshold
            new_A(i,j) = 0;
        else
            new_A(i,j) = 255;
        end;
    end;
end;

figure;
imshow(new_A);
title('Black and White');

figure;
imhist(new_A);
title('2 value histogram');
