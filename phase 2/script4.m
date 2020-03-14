clc;
close all;
clear all;

k1 = 4;
h = [1 1 1; 1 -8 1;1 1 1];

river1 = imread('river1.bmp');
river2 = imread('river2.bmp');
rv1 = rgb2gray(river1);
rv2 = rgb2gray(river2);

median1 = medfilt2(rv1,[k1 k1]);
median2 = medfilt2(rv2,[k1 k1]);

med1 = imfilter(rv1,h);
med2 = imfilter(rv2,h);

figure;
subplot(2,2,1);
imshow(median1);
title('River Image 1');
subplot(2,2,2);
imshow(med1);
title('H filter in first image');
subplot(2,2,3);
imshow(median2);
title('River Image 2');
subplot(2,2,4);
imshow(med2);
title('H filter in second image');