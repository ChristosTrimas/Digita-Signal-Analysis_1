clear all;
close all;
clc

[A,map] = imread('tools.bmp');

figure;
imshow(A);
title('Tools original image');

A_h = histeq(A);

F = abs(fftshift(fft2(A_h)));

F_A = 17*log(1+F);

figure;
colormap(map);
image(F_A);
title('Histogram equalization and Fourier Transformation');

figure;
colormap(jet(256));
image(F_A);
title('Histogram equalization and Fourier Transformation');