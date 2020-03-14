clc;
close all;
clear all;

%k1 = 6 + 9 + 7 = 4

k1 = 4;
k2 = k1 + 3;

A = imread('brain.gif');
figure;
imshow(A);
title('Brain image');

median1 = medfilt2(A,[k1 k1]);
median2 = medfilt2(A,[k2 k2]);

g1 = fspecial('gaussian',[k1 k1]);
g2 = fspecial('gaussian',[k2 k2]);
gaussian1 = imfilter(A,g1);
gaussian2 = imfilter(A,g2);

figure;
subplot(2,2,1);
imshow(median1)
title('Median with k1');
subplot(2,2,2);
imshow(median2);
title('Median with k2');
subplot(2,2,3)
imshow(gaussian1);
title('Gaussian with k1');
subplot(2,2,4);
imshow(gaussian2);
title('Gaussian with k2');
