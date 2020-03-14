clc;
clear all;
close all;

k1 = 4;
k2 = k1+3;
A = imread('brain.gif');

sp = imnoise(A,'salt & pepper',0.1);
figure;
imshow(sp);

median1 = medfilt2(sp,[k1 k1]);
median2 = medfilt2(sp,[k2 k2]);

avg1 = fspecial('average',[k1 k1]);
avg2 = fspecial('average',[k2 k2]);
average1 = imfilter(sp,avg1);
average2 = imfilter(sp,avg2);

figure;
subplot(2,2,1);
imshow(median1);
title('Median with k1');
subplot(2,2,2);
imshow(median2);
title('Median with k2');
subplot(2,2,3);
imshow(average1);
title('Average with k1');
subplot(2,2,4);
imshow(average2);
title('Average with k2');

error1 = immse(median1,sp)
error2 = immse(median2,sp)
error3 = immse(average1,sp)
error4 = immse(average2 ,sp)

