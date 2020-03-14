close all;
clear all;
clc

[A,map1] = imread('eiffel.bmp');

X = rgb2gray(A);

figure;
subplot(2,1,1);
imshow(A);

F_X = abs(fftshift(fft2(X)));

subplot(2,1,2);
colormap(jet(256));
image(F_X);
title('Vertical Image and Fourier Transformation');

[B,map2] = imread('matches.bmp');

Y = rgb2gray(B);

figure;
subplot(2,1,1);
imshow(B);

F_Y = abs(fftshift(fft2(Y)));

subplot(2,1,2);
colormap(jet(256));
image(F_Y);
title('Horizontial Image and Fourier Transformation');