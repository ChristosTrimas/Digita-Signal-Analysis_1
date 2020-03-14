%Lab 3
%Christos Trimas
%Aggelos Kartakis
%Pantelis Kostantinos

clear all;
close all;
clc

[Image,map] = imread('tools.bmp');

Y = fft2(Image);
F = abs(fftshift(Y));

figure;
imshow(Image);
title('Original Image');

figure;
colormap(map);
image(F);
title('Fourier Transformation');

c = jet(256);
figure;
colormap(c);
image(F);
title('Fourier using jet command');

for i = 0:5:50
D = i*log(1+F);

figure;
image(D);
colormap(map);

figure;
image(D);
colormap(jet(256));

figure;
mesh(D);
colormap(jet);
end;